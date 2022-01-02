package cn.bootx.iam.core.upms.service;

import cn.bootx.common.core.annotation.NestedPermission;
import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.iam.core.scope.dao.DataScopeDeptManager;
import cn.bootx.iam.core.scope.dao.DataScopeManager;
import cn.bootx.iam.core.scope.dao.DataScopeUserManager;
import cn.bootx.iam.core.scope.entity.DataScope;
import cn.bootx.iam.core.scope.entity.DataScopeDept;
import cn.bootx.iam.core.scope.entity.DataScopeUser;
import cn.bootx.iam.core.upms.dao.UserDataScopeManager;
import cn.bootx.iam.core.upms.entity.UserDataScope;
import cn.bootx.iam.dto.scope.DataScopeDto;
import cn.bootx.starter.data.perm.code.DataScopeEnum;
import cn.bootx.starter.data.perm.scope.DataPermScope;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

import static cn.bootx.iam.code.CachingCode.USER_DATA_SCOPE;

/**   
* 用户数据权限关联关系
* @author xxm
* @date 2021/12/23
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class UserDataScopeService {
    private final UserDataScopeManager userDataScopeManager;
    private final DataScopeManager dataScopeManager;
    private final DataScopeUserManager dataScopeUserManager;
    private final DataScopeDeptManager dataScopeDeptManager;

    /**
     * 给用户数据权限关联关系
     */
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(value = {USER_DATA_SCOPE},key = "#userId")
    public void saveAndUpdate(Long userId, Long dataScopeId){
        // 先删除用户拥有的数据权限
        userDataScopeManager.deleteByUser(userId);
        if (Objects.nonNull(dataScopeId)){
            userDataScopeManager.save(new UserDataScope(userId,dataScopeId));
        }
    }

    /**
     * 查询用户所对应的数据权限信息
     */
    public List<DataScopeDto> findDataScopeListByUser(Long userId) {
        return ResultConvertUtil.dtoListConvert(dataScopeManager.findAllByIds(this.findDataScopeIdsByUser(userId)));
    }

    /**
     * 查询用户所对应的数据权限id
     */
    public List<Long> findDataScopeIdsByUser(Long userId) {
        return userDataScopeManager.findByUserId(userId).stream()
                .map(UserDataScope::getDataScopeId)
                .collect(Collectors.toList());
    }

    /**
     * 根据用户id获取对应的数据权限范围
     */
    @NestedPermission
    @Cacheable(value = USER_DATA_SCOPE,key = "#userId")
    public DataPermScope getDataPermScopeByUser(Long userId){
        DataPermScope dataPermScope = new DataPermScope();
        List<UserDataScope> userDataScopes = userDataScopeManager.findByUserId(userId);

        if (CollUtil.isEmpty(userDataScopes)){
            return dataPermScope.setScopeType(DataScopeEnum.SELF);
        }
        UserDataScope userDataScope = userDataScopes.get(1);
        DataScope dataScope = dataScopeManager.findById(userDataScope.getDataScopeId()).orElseThrow(() -> new BizException("数据权限[配置不存在"));

        dataPermScope.setScopeType(DataScopeEnum.findByCode(dataScope.getType()));
        // 用户
        if (Objects.equals(dataScope.getType(), DataScopeEnum.USER_SCOPE.getCode())){
            Set<Long> collect = dataScopeUserManager.findByDateScopeId(dataScope.getId()).stream()
                    .map(DataScopeUser::getUserId)
                    .collect(Collectors.toSet());
            return dataPermScope.setUserScopeIds(collect);
        }
        // 部门
        else if (Objects.equals(dataScope.getType(), DataScopeEnum.DEPT_SCOPE.getCode())){
            Set<Long> collect = dataScopeDeptManager.findByDateScopeId(dataScope.getId()).stream()
                    .map(DataScopeDept::getDeptId)
                    .collect(Collectors.toSet());
            return dataPermScope.setDeptScopeIds(collect);
        }
        // 用户和部门
        else if (Objects.equals(dataScope.getType(), DataScopeEnum.DEPT_AND_USER_SCOPE.getCode())){
            Set<Long> userIds = dataScopeUserManager.findByDateScopeId(dataScope.getId()).stream()
                    .map(DataScopeUser::getUserId)
                    .collect(Collectors.toSet());
            Set<Long> deptIds = dataScopeDeptManager.findByDateScopeId(dataScope.getId()).stream()
                    .map(DataScopeDept::getDeptId)
                    .collect(Collectors.toSet());
            return dataPermScope.setDeptScopeIds(deptIds).setUserScopeIds(userIds);
        } else {
            return dataPermScope;
        }
    }
}

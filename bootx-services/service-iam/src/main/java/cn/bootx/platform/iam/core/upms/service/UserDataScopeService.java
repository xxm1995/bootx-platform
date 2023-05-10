package cn.bootx.platform.iam.core.upms.service;

import cn.bootx.platform.common.core.annotation.CountTime;
import cn.bootx.platform.common.core.annotation.NestedPermission;
import cn.bootx.platform.common.core.exception.BizException;
import cn.bootx.platform.common.core.exception.DataNotExistException;
import cn.bootx.platform.iam.core.scope.dao.DataScopeDeptManager;
import cn.bootx.platform.iam.core.scope.dao.DataScopeManager;
import cn.bootx.platform.iam.core.scope.dao.DataScopeUserManager;
import cn.bootx.platform.iam.core.scope.entity.DataScope;
import cn.bootx.platform.iam.core.scope.entity.DataScopeDept;
import cn.bootx.platform.iam.core.scope.entity.DataScopeUser;
import cn.bootx.platform.iam.core.user.dao.UserDeptManager;
import cn.bootx.platform.iam.core.user.entity.UserDept;
import cn.bootx.platform.starter.data.perm.code.DataScopeEnum;
import cn.bootx.platform.starter.data.perm.scope.DataPermScope;
import cn.bootx.platform.common.mybatisplus.base.MpIdEntity;
import cn.bootx.platform.iam.core.dept.dao.DeptManager;
import cn.bootx.platform.iam.core.dept.entity.Dept;
import cn.bootx.platform.iam.core.upms.dao.UserDataScopeManager;
import cn.bootx.platform.iam.core.upms.entity.UserDataScope;
import cn.bootx.platform.iam.dto.scope.DataScopeDto;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

import static cn.bootx.platform.iam.code.CachingCode.USER_DATA_SCOPE;

/**
 * 用户数据权限关联关系
 *
 * @author xxm
 * @date 2021/12/23
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class UserDataScopeService {

    private final UserDataScopeManager userDataScopeManager;

    private final UserDeptManager userDeptManager;

    private final DataScopeManager dataScopeManager;

    private final DataScopeUserManager dataScopeUserManager;

    private final DataScopeDeptManager dataScopeDeptManager;

    private final DeptManager deptManager;

    /**
     * 给用户数据权限关联关系
     */
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(value = { USER_DATA_SCOPE }, key = "#userId")
    public void saveAssign(Long userId, Long dataScopeId) {
        // 先删除用户拥有的数据权限
        userDataScopeManager.deleteByUser(userId);
        if (Objects.nonNull(dataScopeId)) {
            userDataScopeManager.save(new UserDataScope(userId, dataScopeId));
        }
    }

    /**
     * 给用户数据权限关联关系
     */
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(value = { USER_DATA_SCOPE }, key = "#userIds")
    public void saveAssignBatch(List<Long> userIds, Long dataScopeId) {
        // 先删除用户拥有的数据权限
        userDataScopeManager.deleteByUsers(userIds);
        List<UserDataScope> userDataScopes = userIds.stream()
            .map(userId -> new UserDataScope(userId, dataScopeId))
            .collect(Collectors.toList());
        userDataScopeManager.saveAll(userDataScopes);
    }

    /**
     * 查询用户所对应的数据权限信息
     */
    public DataScopeDto findDataScopeByUser(Long userId) {
        if (Objects.isNull(this.findDataScopeIdByUser(userId))) {
            return new DataScopeDto();
        }
        return dataScopeManager.findById(this.findDataScopeIdByUser(userId))
            .map(DataScope::toDto)
            .orElseThrow(DataNotExistException::new);
    }

    /**
     * 查询用户所对应的数据权限id
     */
    public Long findDataScopeIdByUser(Long userId) {
        return userDataScopeManager.findByUserId(userId).map(UserDataScope::getDataScopeId).orElse(null);

    }

    /**
     * 根据用户id获取对应的数据权限范围
     */
    @CountTime
    @NestedPermission
    @Cacheable(value = USER_DATA_SCOPE, key = "#userId")
    public DataPermScope getDataPermScopeByUser(Long userId) {
        DataPermScope dataPermScope = new DataPermScope();
        List<UserDataScope> userDataScopes = userDataScopeManager.findAllByUserId(userId);

        if (CollUtil.isEmpty(userDataScopes)) {
            return dataPermScope.setScopeType(DataScopeEnum.SELF);
        }
        UserDataScope userDataScope = userDataScopes.get(0);
        DataScope dataScope = dataScopeManager.findById(userDataScope.getDataScopeId())
            .orElseThrow(() -> new BizException("数据权限[配置不存在"));

        dataPermScope.setScopeType(DataScopeEnum.findByCode(dataScope.getType()));
        // 用户
        if (Objects.equals(dataScope.getType(), DataScopeEnum.USER_SCOPE.getCode())) {
            Set<Long> collect = dataScopeUserManager.findByDateScopeId(dataScope.getId())
                .stream()
                .map(DataScopeUser::getUserId)
                .collect(Collectors.toSet());
            return dataPermScope.setUserScopeIds(collect);
        }
        // 部门
        else if (Objects.equals(dataScope.getType(), DataScopeEnum.DEPT_SCOPE.getCode())) {
            Set<Long> collect = dataScopeDeptManager.findByDateScopeId(dataScope.getId())
                .stream()
                .map(DataScopeDept::getDeptId)
                .collect(Collectors.toSet());
            return dataPermScope.setDeptScopeIds(collect);
        }
        // 用户和部门
        else if (Objects.equals(dataScope.getType(), DataScopeEnum.DEPT_AND_USER_SCOPE.getCode())) {
            Set<Long> userIds = dataScopeUserManager.findByDateScopeId(dataScope.getId())
                .stream()
                .map(DataScopeUser::getUserId)
                .collect(Collectors.toSet());
            Set<Long> deptIds = dataScopeDeptManager.findByDateScopeId(dataScope.getId())
                .stream()
                .map(DataScopeDept::getDeptId)
                .collect(Collectors.toSet());
            return dataPermScope.setDeptScopeIds(deptIds).setUserScopeIds(userIds);
        }
        // 自己所属的部门
        else if (Objects.equals(dataScope.getType(), DataScopeEnum.BELONG_DEPT.getCode())) {
            Set<Long> deptIds = userDeptManager.findDeptIdsByUser(userId)
                .stream()
                .map(UserDept::getDeptId)
                .collect(Collectors.toSet());
            return dataPermScope.setDeptScopeIds(deptIds);
        }
        // 自己所属的部门和下级部门
        else if (Objects.equals(dataScope.getType(), DataScopeEnum.BELONG_DEPT_AND_SUB.getCode())) {
            Set<Long> deptIds = this.findSubDeptList(userId);
            return dataPermScope.setDeptScopeIds(deptIds);
        }
        else {
            // 默认是只能查看自己的数据
            return dataPermScope;
        }
    }

    /**
     * 查找自己及子级部门
     */
    private Set<Long> findSubDeptList(Long userId) {
        Set<Long> deptIds = userDeptManager.findDeptIdsByUser(userId)
            .stream()
            .map(UserDept::getDeptId)
            .collect(Collectors.toSet());
        Map<Long, Dept> deptMap = deptManager.findAll()
            .stream()
            .collect(Collectors.toMap(MpIdEntity::getId, Function.identity()));
        Set<String> deptOrgCodes = deptIds.stream().map(deptMap::get).map(Dept::getOrgCode).collect(Collectors.toSet());
        return deptMap.values()
            .stream()
            .filter(dept -> this.judgeSubDept(dept.getOrgCode(), deptOrgCodes))
            .map(MpIdEntity::getId)
            .collect(Collectors.toSet());
    }

    /**
     * 判断是否是子部门
     */
    private boolean judgeSubDept(String orgCode, Set<String> orgCodes) {
        return orgCodes.stream().anyMatch(s -> StrUtil.startWith(s, orgCode));
    }

}

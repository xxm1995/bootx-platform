package cn.bootx.iam.core.scope.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.function.CollectorsFunction;
import cn.bootx.iam.core.scope.dao.DataScopeManager;
import cn.bootx.iam.core.scope.dao.DataScopeUserManager;
import cn.bootx.iam.core.scope.entity.DataScope;
import cn.bootx.iam.core.scope.entity.DataScopeUser;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.dto.scope.DataScopeUserInfoDto;
import cn.bootx.starter.data.perm.code.DataScopeEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.Collectors;

import static cn.bootx.iam.code.CachingCode.USER_DATA_SCOPE;

/**
 * 数据范围权限限定用户级别
 *
 * @author xxm
 * @date 2022/1/4
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class DataScopeUserService {

    private final DataScopeManager dataScopeManager;

    private final DataScopeUserManager dataScopeUserManager;

    private final UserInfoManager userInfoManager;

    /**
     * 关联用户列表
     */
    public List<DataScopeUserInfoDto> findUsersByDataScopeId(Long dataScopeId) {
        Map<Long, DataScopeUser> dataScopeUserMap = dataScopeUserManager.findByDateScopeId(dataScopeId)
            .stream()
            .collect(Collectors.toMap(DataScopeUser::getUserId, Function.identity(), CollectorsFunction::retainLatest));
        // 查询出用户id
        List<Long> userIds = dataScopeUserMap.values()
            .stream()
            .map(DataScopeUser::getUserId)
            .collect(Collectors.toList());
        // 查询出用户
        List<UserInfo> userInfos = userInfoManager.findAllByIds(userIds);

        return userInfos.stream()
            .map(userInfo -> new DataScopeUserInfoDto().setId(dataScopeUserMap.get(userInfo.getId()).getId())
                .setUserId(userInfo.getId())
                .setUsername(userInfo.getUsername())
                .setName(userInfo.getName()))
            .collect(Collectors.toList());
    }

    /**
     * 添加用户范围权限关联关系
     */
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(value = { USER_DATA_SCOPE }, allEntries = true)
    public void saveUserAssign(Long dataScopeId, List<Long> userIds) {
        DataScope dataScope = dataScopeManager.findById(dataScopeId).orElseThrow(() -> new BizException("数据不存在"));
        if (!Objects.equals(dataScope.getType(), DataScopeEnum.USER_SCOPE.getCode())
                && Objects.equals(dataScope.getType(), DataScopeEnum.DEPT_AND_USER_SCOPE.getCode())) {
            throw new BizException("非法操作");
        }
        List<Long> dataScopeUserIds = dataScopeUserManager.findByDateScopeId(dataScopeId)
            .stream()
            .map(DataScopeUser::getUserId)
            .collect(Collectors.toList());

        List<DataScopeUser> dataScopeUsers = userIds.stream()
            .filter(userId -> !dataScopeUserIds.contains(userId))
            .map(userId -> new DataScopeUser(dataScopeId, userId))
            .collect(Collectors.toList());
        dataScopeUserManager.saveAll(dataScopeUsers);
    }

    /**
     * 批量删除
     */
    @CacheEvict(value = { USER_DATA_SCOPE }, allEntries = true)
    public void deleteBatch(List<Long> ids) {
        dataScopeUserManager.deleteByIds(ids);
    }

}

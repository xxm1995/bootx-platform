package cn.bootx.iam.core.upms.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.iam.core.upms.entity.UserRole;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
* 用户角色关系
* @author xxm
* @date 2021/8/3
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class UserRoleManager extends BaseManager<UserRoleMapper,UserRole> {

    public boolean existsByRoleId(Long roleId) {
        return existedByField(UserRole::getRoleId,roleId);
    }

    public void deleteByUser(Long userId) {
        deleteByField(UserRole::getUserId,userId);
    }

    public List<UserRole> findRoleIdsByUser(Long userId) {
        return findAllByField(UserRole::getUserId,userId);
    }
}

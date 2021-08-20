package cn.bootx.iam.core.upms.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.iam.core.upms.entity.RolePermission;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

/**   
* 角色权限关系
* @author xxm  
* @date 2021/8/3 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class RolePermissionManager extends BaseManager<RolePermissionMapper, RolePermission> {

    public void deleteByRole(Long roleId) {
        deleteByField(RolePermission::getRoleId,roleId);
    }

    public List<RolePermission> findAllByRoles(List<Long> roleIds) {
        return findAllByFields(RolePermission::getRoleId,roleIds);
    }

    public List<RolePermission> findAllByRole(Long roleId) {
        return findAllByField(RolePermission::getRoleId,roleId);
    }
}

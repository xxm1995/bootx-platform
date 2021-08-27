package cn.bootx.iam.core.upms.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.iam.core.upms.entity.RoleMenu;
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
public class RoleMenuManager extends BaseManager<RoleMenuMapper, RoleMenu> {

    public void deleteByRole(Long roleId) {
        deleteByField(RoleMenu::getRoleId,roleId);
    }

    public void deleteByPermission(Long permissionId) {
        deleteByField(RoleMenu::getPermissionId,permissionId);
    }

    public List<RoleMenu> findAllByRoles(List<Long> roleIds) {
        return findAllByFields(RoleMenu::getRoleId,roleIds);
    }

    public List<RoleMenu> findAllByRole(Long roleId) {
        return findAllByField(RoleMenu::getRoleId,roleId);
    }
}

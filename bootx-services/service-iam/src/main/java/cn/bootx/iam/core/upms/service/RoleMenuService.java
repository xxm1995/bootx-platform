package cn.bootx.iam.core.upms.service;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.iam.code.PermissionCode;
import cn.bootx.iam.core.permission.service.PermMenuService;
import cn.bootx.iam.core.upms.dao.RoleMenuManager;
import cn.bootx.iam.core.upms.entity.RoleMenu;
import cn.bootx.iam.dto.permission.PermMenuDto;
import cn.bootx.iam.dto.upms.MenuAndResourceDto;
import cn.bootx.starter.auth.exception.NotLoginException;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 角色权限菜单关系
 * @author xxm
 * @date 2021/8/3
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class RoleMenuService {
    private final RoleMenuManager roleMenuManager;

    private final UserRoleService userRoleService;
    private final PermMenuService permMenuService;

    /**
     * 保存角色菜单授权
     */
    @Transactional(rollbackFor = Exception.class)
    public void save(Long roleId, List<Long> permissionIds){
        // 删旧增新
        roleMenuManager.deleteByRole(roleId);
        List<RoleMenu> roleMenus = permissionIds.stream()
                .map(permissionId -> new RoleMenu(roleId, permissionId))
                .collect(Collectors.toList());
        roleMenuManager.saveAll(roleMenus);
    }

    /**
     * 根据角色查询对应的权限id
     */
    public List<Long> findPermissionIdsByRole(Long roleId){
        List<RoleMenu> rolePermissions = roleMenuManager.findAllByRole(roleId);
        return rolePermissions.stream()
                .map(RoleMenu::getPermissionId)
                .collect(Collectors.toList());
    }

    /**
     * 获取菜单权限树, 不包含资源权限
     */
    public List<PermMenuDto> findMenuTree(){
        List<PermMenuDto> permissions = this.findPermissions();
        List<PermMenuDto> permissionsByNotButton = permissions.stream()
                .filter(o -> !Objects.equals(PermissionCode.MENU_TYPE_RESOURCE, o.getMenuType()))
                .collect(Collectors.toList());
        return this.recursiveBuildTree(permissionsByNotButton, null);
    }

    /**
     * 获取权限树, 包含菜单和资源权限
     */
    public List<PermMenuDto> findAllTree(){
        return this.recursiveBuildTree(this.findPermissions(), null);
    }

    /**
     * 获取权限菜单id列表,不包含资源权限
     */
    public List<Long> findMenuIds() {
        List<PermMenuDto> permissions = this.findPermissions();
        return permissions.stream()
                .filter(o -> !Objects.equals(PermissionCode.MENU_TYPE_RESOURCE, o.getMenuType()))
                .map(PermMenuDto::getId)
                .collect(Collectors.toList());
    }

    /**
     * 获取权限id列表,包含菜单和资源权限
     */
    public List<Long> findPermissionIds() {
        List<PermMenuDto> permissions = this.findPermissions();
        return permissions.stream()
                .map(PermMenuDto::getId)
                .collect(Collectors.toList());
    }

    /**
     * 获取菜单和资源权限
     */
    public MenuAndResourceDto getPermissions(){
        List<PermMenuDto> permissions = this.findPermissions();
        List<String> resourcePerms = permissions.stream()
                .filter(o -> Objects.equals(PermissionCode.MENU_TYPE_RESOURCE, o.getMenuType()))
                .map(PermMenuDto::getPermCode)
                .collect(Collectors.toList());
        List<PermMenuDto> menus = permissions.stream()
                .filter(o -> !Objects.equals(PermissionCode.MENU_TYPE_RESOURCE, o.getMenuType()))
                .collect(Collectors.toList());
        return new MenuAndResourceDto()
                .setResourcePerms(resourcePerms)
                .setMenus(this.recursiveBuildTree(menus, null));
    }

    /**
     * 获取权限信息列表
     */
    private List<PermMenuDto> findPermissions(){
        UserDetail userDetail = SecurityUtil.getCurrentUser().orElseThrow(NotLoginException::new);
        List<PermMenuDto> permissions;

        //系统管理员，获取全部的权限
        if (userDetail.isAdmin()) {
            permissions = permMenuService.findAll();
        } else {
            // 非管理员获取自身拥有的权限
            permissions = this.findPermissionsByUser(userDetail.getId());
        }
        return permissions;
    }

    /**
     * 查询用户查询拥有的权限信息
     */
    private List<PermMenuDto> findPermissionsByUser(Long userId){
        List<PermMenuDto> permissions = new ArrayList<>(0);

        List<Long> roleIds = userRoleService.findRoleIdsByUser(userId);
        if (CollUtil.isEmpty(roleIds)){
            return permissions;
        }
        List<RoleMenu> roleMenus = roleMenuManager.findAllByRoles(roleIds);
        List<Long> permissionIds = roleMenus.stream()
                .map(RoleMenu::getPermissionId)
                .distinct()
                .collect(Collectors.toList());
        if (CollUtil.isNotEmpty(permissionIds)){
            permissions = permMenuService.findByIds(permissionIds);
        }
        return permissions;
    }

    /**
     * 递归建树
     *
     * @param permissions 查询出的菜单数据
     * @param parentId    父节点ID
     * @return 递归后的树列表
     */
    private List<PermMenuDto> recursiveBuildTree(List<PermMenuDto> permissions, Long parentId) {
        List<PermMenuDto> children = permissions.stream()
                .filter(m -> Objects.equals(m.getParentId(),parentId))
                .collect(Collectors.toList());
        if (CollectionUtil.isEmpty(children)) {
            return new ArrayList<>(0);
        }
        for (PermMenuDto permission : children) {
            permission.setChildren(recursiveBuildTree(permissions, permission.getId()));
        }
        children.sort(Comparator.comparingDouble(PermMenuDto::getSortNo));
        return children;
    }

}

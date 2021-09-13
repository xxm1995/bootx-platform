package cn.bootx.iam.core.upms.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.iam.code.PermissionCode;
import cn.bootx.iam.core.permission.service.PermissionMenuService;
import cn.bootx.iam.core.upms.dao.RoleMenuManager;
import cn.bootx.iam.core.upms.entity.RoleMenu;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.dto.permission.PermissionMenuDto;
import cn.bootx.iam.dto.upms.UserMenuAndButtonDto;
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
    private final UserInfoManager userInfoManager;

    private final UserRoleService userRoleService;
    private final PermissionMenuService permissionMenuService;

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
    public List<Long> findIdsByRole(Long roleId){
        List<RoleMenu> rolePermissions = roleMenuManager.findAllByRole(roleId);
        return rolePermissions.stream()
                .map(RoleMenu::getPermissionId)
                .collect(Collectors.toList());
    }

    /**
     * 获取权限树
     */
    public List<PermissionMenuDto> tree(){
        return recursiveBuildTree(this.findPermissions(), null);
    }

    /**
     * 获取菜单权限树, 不包含按钮权限
     */
    public List<PermissionMenuDto> findMenuTree(){
        List<PermissionMenuDto> permissions = this.findPermissions();
        List<PermissionMenuDto> permissionsByNotButton = permissions.stream()
                .filter(o -> !Objects.equals(PermissionCode.MENU_TYPE_BUTTON, o.getMenuType()))
                .collect(Collectors.toList());
        return this.recursiveBuildTree(permissionsByNotButton, null);
    }

    /**
     * 获取权限菜单id列表,不包含按钮权限
     */
    public List<Long> findMenuIds() {
        List<PermissionMenuDto> permissions = this.findPermissions();
        return permissions.stream()
                .filter(o -> !Objects.equals(PermissionCode.MENU_TYPE_BUTTON, o.getMenuType()))
                .map(PermissionMenuDto::getId)
                .collect(Collectors.toList());
    }

    /**
     * 获取按钮权限
     */
    public List<String> findButtonPermission(){
        List<PermissionMenuDto> permissions = this.findPermissions();
        return permissions.stream()
                .filter(o -> Objects.equals(PermissionCode.MENU_TYPE_BUTTON, o.getMenuType()))
                .map(PermissionMenuDto::getPerms)
                .collect(Collectors.toList());
    }

    /**
     * 获取菜单和按钮权限
     */
    public UserMenuAndButtonDto findMenuAndButtonPermission(){
        List<PermissionMenuDto> permissions = this.findPermissions();
        List<String> buttonPermissions = permissions.stream()
                .filter(o -> Objects.equals(PermissionCode.MENU_TYPE_BUTTON, o.getMenuType()))
                .map(PermissionMenuDto::getPerms)
                .collect(Collectors.toList());
        List<PermissionMenuDto> menus = permissions.stream()
                .filter(o -> !Objects.equals(PermissionCode.MENU_TYPE_BUTTON, o.getMenuType()))
                .collect(Collectors.toList());
        return new UserMenuAndButtonDto()
                .setButtonPermissions(buttonPermissions)
                .setMenus(this.recursiveBuildTree(menus, null));
    }

    /**
     * 获取权限
     */
    private List<PermissionMenuDto> findPermissions(){
        Long userId = SecurityUtil.getUserId();
        UserInfo userInfo = userInfoManager.findById(userId).orElseThrow(() -> new BizException("用户不存在"));
        List<PermissionMenuDto> permissions;

        //系统管理员，获取全部的菜单
        if (userInfo.isAdmin()) {
            permissions = permissionMenuService.findAll();
        } else {
            // 非管理员获取自身拥有权限的菜单
            permissions = this.findPermissionsByUser(userInfo.getId());
        }
        return permissions;
    }

    /**
     * 查询用户查询拥有的权限信息
     */
    public List<PermissionMenuDto> findPermissionsByUser(Long userId){
        List<PermissionMenuDto> permissions = new ArrayList<>(0);

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
            permissions = permissionMenuService.findByIds(permissionIds);
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
    private List<PermissionMenuDto> recursiveBuildTree(List<PermissionMenuDto> permissions, Long parentId) {
        List<PermissionMenuDto> children = permissions.stream()
                .filter(m -> Objects.equals(m.getParentId(),parentId))
                .collect(Collectors.toList());
        if (CollectionUtil.isEmpty(children)) {
            return new ArrayList<>(0);
        }
        for (PermissionMenuDto permission : children) {
            permission.setChildren(recursiveBuildTree(permissions, permission.getId()));
        }
        children.sort(Comparator.comparingDouble(PermissionMenuDto::getSortNo));
        return children;
    }

}

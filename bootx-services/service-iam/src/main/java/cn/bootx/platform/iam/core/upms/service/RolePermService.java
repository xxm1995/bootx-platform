package cn.bootx.platform.iam.core.upms.service;

import cn.bootx.platform.common.core.annotation.NestedPermission;
import cn.bootx.platform.common.core.entity.UserDetail;
import cn.bootx.platform.common.core.rest.dto.BaseDto;
import cn.bootx.platform.common.core.util.TreeBuildUtil;
import cn.bootx.platform.common.mybatisplus.base.MpIdEntity;
import cn.bootx.platform.iam.code.PermissionCode;
import cn.bootx.platform.iam.core.permission.service.PermMenuService;
import cn.bootx.platform.iam.core.upms.dao.RoleMenuManager;
import cn.bootx.platform.iam.core.upms.entity.RoleMenu;
import cn.bootx.platform.iam.core.user.dao.UserExpandInfoManager;
import cn.bootx.platform.iam.dto.permission.PermMenuDto;
import cn.bootx.platform.iam.dto.upms.MenuAndResourceDto;
import cn.bootx.platform.starter.auth.entity.UserStatus;
import cn.bootx.platform.starter.auth.exception.NotLoginException;
import cn.bootx.platform.starter.auth.service.UserStatusService;
import cn.bootx.platform.starter.auth.util.SecurityUtil;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import static cn.bootx.platform.iam.code.CachingCode.USER_PERM_CODE;

/**
 * 角色权限菜单关系
 *
 * @author xxm
 * @since 2021/8/3
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class RolePermService {

    private final UserStatusService userStatusService;

    private final RoleMenuManager roleMenuManager;

    private final UserRoleService userRoleService;

    private final PermMenuService permMenuService;

    /**
     * 保存角色菜单授权
     */
    @CacheEvict(value = { USER_PERM_CODE }, allEntries = true)
    @Transactional(rollbackFor = Exception.class)
    public void save(Long roleId, String clientCode, List<Long> permissionIds) {
        // 先删后增
        List<RoleMenu> RoleMenus = roleMenuManager.findAllByRoleAndClientCode(roleId, clientCode);
        List<Long> roleMenuIds = RoleMenus.stream().map(RoleMenu::getPermissionId).collect(Collectors.toList());
        // 需要删除的
        List<Long> deleteIds = RoleMenus.stream()
            .filter(rolePath -> !permissionIds.contains(rolePath.getPermissionId()))
            .map(MpIdEntity::getId)
            .collect(Collectors.toList());

        List<RoleMenu> roleMenus = permissionIds.stream()
            .filter(id -> !roleMenuIds.contains(id))
            .map(permissionId -> new RoleMenu(roleId, clientCode, permissionId))
            .collect(Collectors.toList());
        roleMenuManager.deleteByIds(deleteIds);
        roleMenuManager.saveAll(roleMenus);
    }

    /**
     * 根据角色查询对应的权限id
     */
    public List<Long> findPermissionIdsByRole(Long roleId, String clientCode) {
        List<RoleMenu> rolePermissions = roleMenuManager.findAllByRoleAndClientCode(roleId, clientCode);
        return rolePermissions.stream().map(RoleMenu::getPermissionId).collect(Collectors.toList());
    }

    /**
     * 获取菜单权限树, 不包含资源权限(权限码)
     */
    public List<PermMenuDto> findMenuTree(String clientCode) {
        List<PermMenuDto> permissions = this.findPermissions(clientCode);
        List<PermMenuDto> permissionsByNotButton = permissions.stream()
            .filter(o -> !Objects.equals(PermissionCode.MENU_TYPE_RESOURCE, o.getMenuType()))
            .collect(Collectors.toList());
        return this.recursiveBuildTree(permissionsByNotButton);
    }

    /**
     * 获取权限树, 包含菜单和资源权限(权限码)
     */
    public List<PermMenuDto> findAllTree(String clientCode) {
        return this.recursiveBuildTree(this.findPermissions(clientCode));
    }

    /**
     * 获取权限菜单id列表,不包含资源权限(权限码)
     */
    public List<Long> findMenuIds(String clientCode) {
        List<PermMenuDto> permissions = this.findPermissions(clientCode);
        return permissions.stream()
            .filter(o -> !Objects.equals(PermissionCode.MENU_TYPE_RESOURCE, o.getMenuType()))
            .map(PermMenuDto::getId)
            .collect(Collectors.toList());
    }

    /**
     * 获取菜单和资源权限(权限码)
     */
    public MenuAndResourceDto getPermissions(String clientCode) {
        List<PermMenuDto> permissions = this.findPermissions(clientCode);
        List<String> resourcePerms = permissions.stream()
            .filter(o -> Objects.equals(PermissionCode.MENU_TYPE_RESOURCE, o.getMenuType()))
            .filter(PermMenuDto::isEffect)
            .map(PermMenuDto::getPermCode)
            .collect(Collectors.toList());
        List<PermMenuDto> menus = permissions.stream()
            .filter(o -> !Objects.equals(PermissionCode.MENU_TYPE_RESOURCE, o.getMenuType()))
            .collect(Collectors.toList());
        return new MenuAndResourceDto().setResourcePerms(resourcePerms).setMenus(this.recursiveBuildTree(menus));
    }

    /**
     * 获取权限信息列表
     */
    private List<PermMenuDto> findPermissions(String clientCode) {
        UserDetail userDetail = SecurityUtil.getCurrentUser().orElseThrow(NotLoginException::new);
        List<PermMenuDto> permissions;

        // 系统管理员，获取全部的权限
        if (userDetail.isAdmin()) {
            permissions = permMenuService.findAllByClientCode(clientCode);
        }
        else {
            // 非管理员获取自身拥有的权限
            permissions = this.findPermissionsByUser(userDetail.getId())
                .stream()
                .filter(o -> Objects.equals(clientCode, o.getClientCode()))
                .collect(Collectors.toList());
        }
        return permissions;
    }

    /**
     * 获取有效的资源(权限码)列表(后端使用,直接获取所有终端的权限码)
     */
    @Cacheable(value = USER_PERM_CODE, key = "#userId")
    @NestedPermission
    public List<String> findEffectPermCodesByUserId(Long userId) {
        // 获取关联的的权限码
        List<PermMenuDto> permissions = this.findPermissionsByUser(userId);
        return permissions.stream()
            .filter(o -> Objects.equals(o.getMenuType(), PermissionCode.MENU_TYPE_RESOURCE))
            .filter(PermMenuDto::isEffect)
            .map(PermMenuDto::getPermCode)
            .collect(Collectors.toList());
    }

    /**
     * 查询用户查询拥有的权限信息(直接获取所有终端的权限码),如果当前用户密码是否过期, 过期或者未修改密码, 返回权限为空
     */
    private List<PermMenuDto> findPermissionsByUser(Long userId) {
        // 判断当前用户密码是否过期, 过期或者未修改密码, 返回权限为空
        UserStatus userStatus = userStatusService.getUserStatus();
        if (userStatus.isExpirePassword() || userStatus.isInitialPassword()){
            return new ArrayList<>(0);
        }

        List<PermMenuDto> permissions = new ArrayList<>(0);
        List<Long> roleIds = userRoleService.findRoleIdsByUser(userId);
        if (CollUtil.isEmpty(roleIds)) {
            return permissions;
        }
        List<RoleMenu> roleMenus = roleMenuManager.findAllByRoles(roleIds);
        List<Long> permissionIds = roleMenus.stream()
            .map(RoleMenu::getPermissionId)
            .distinct()
            .collect(Collectors.toList());
        if (CollUtil.isNotEmpty(permissionIds)) {
            permissions = permMenuService.findByIds(permissionIds);
        }
        return permissions;
    }

    /**
     * 递归建树
     * @param permissions 查询出的菜单数据
     * @return 递归后的树列表
     */
    private List<PermMenuDto> recursiveBuildTree(List<PermMenuDto> permissions) {
        return TreeBuildUtil.build(permissions, null, BaseDto::getId, PermMenuDto::getParentId,
                PermMenuDto::setChildren, Comparator.comparingDouble(PermMenuDto::getSortNo));

    }

}

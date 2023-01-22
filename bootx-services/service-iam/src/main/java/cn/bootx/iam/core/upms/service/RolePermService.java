package cn.bootx.iam.core.upms.service;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.common.core.util.TreeBuildUtil;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.iam.code.PermissionCode;
import cn.bootx.iam.core.permission.service.PermMenuService;
import cn.bootx.iam.core.upms.dao.RoleMenuManager;
import cn.bootx.iam.core.upms.entity.RoleMenu;
import cn.bootx.iam.dto.permission.PermMenuDto;
import cn.bootx.iam.dto.upms.MenuAndResourceDto;
import cn.bootx.starter.auth.exception.NotLoginException;
import cn.bootx.starter.auth.util.SecurityUtil;
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

import static cn.bootx.iam.code.CachingCode.USER_PERM_CODE;

/**
 * 角色权限菜单关系
 * @author xxm
 * @date 2021/8/3
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class RolePermService {
    private final RoleMenuManager roleMenuManager;

    private final UserRoleService userRoleService;
    private final PermMenuService permMenuService;

    /**
     * 保存角色菜单授权
     */
    @CacheEvict(value = {USER_PERM_CODE},allEntries = true)
    @Transactional(rollbackFor = Exception.class)
    public void save(Long roleId, String clientCode, List<Long> permissionIds){
        // 先删后增
        List<RoleMenu> RoleMenus = roleMenuManager.findAllByRoleAndClientCode(roleId,clientCode);
        List<Long> roleMenuIds = RoleMenus.stream().map(RoleMenu::getPermissionId).collect(Collectors.toList());
        // 需要删除的
        List<Long> deleteIds = RoleMenus.stream()
                .filter(rolePath -> !permissionIds.contains(rolePath.getPermissionId()))
                .map(MpIdEntity::getId)
                .collect(Collectors.toList());

        List<RoleMenu> roleMenus = permissionIds.stream()
                .filter(id->!roleMenuIds.contains(id))
                .map(permissionId -> new RoleMenu(roleId, clientCode,permissionId))
                .collect(Collectors.toList());
        roleMenuManager.deleteByIds(deleteIds);
        roleMenuManager.saveAll(roleMenus);
    }

    /**
     * 根据角色查询对应的权限id
     */
    public List<Long> findPermissionIdsByRole(Long roleId,String clientCode){
        List<RoleMenu> rolePermissions = roleMenuManager.findAllByRoleAndClientCode(roleId,clientCode);
        return rolePermissions.stream()
                .map(RoleMenu::getPermissionId)
                .collect(Collectors.toList());
    }

    /**
     * 获取菜单权限树, 不包含资源权限(权限码)
     */
    public List<PermMenuDto> findMenuTree(String clientCode){
        List<PermMenuDto> permissions = this.findPermissions(clientCode);
        List<PermMenuDto> permissionsByNotButton = permissions.stream()
                .filter(o -> !Objects.equals(PermissionCode.MENU_TYPE_RESOURCE, o.getMenuType()))
                .collect(Collectors.toList());
        return this.recursiveBuildTree(permissionsByNotButton);
    }

    /**
     * 获取权限树, 包含菜单和资源权限(权限码)
     */
    public List<PermMenuDto> findAllTree(String clientCode){
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
    public MenuAndResourceDto getPermissions(String clientCode){
        List<PermMenuDto> permissions = this.findPermissions(clientCode);
        List<String> resourcePerms = permissions.stream()
                .filter(o -> Objects.equals(PermissionCode.MENU_TYPE_RESOURCE, o.getMenuType()))
                .map(PermMenuDto::getPermCode)
                .collect(Collectors.toList());
        List<PermMenuDto> menus = permissions.stream()
                .filter(o -> !Objects.equals(PermissionCode.MENU_TYPE_RESOURCE, o.getMenuType()))
                .collect(Collectors.toList());
        return new MenuAndResourceDto()
                .setResourcePerms(resourcePerms)
                .setMenus(this.recursiveBuildTree(menus));
    }

    /**
     * 获取权限信息列表
     */
    private List<PermMenuDto> findPermissions(String clientCode){
        UserDetail userDetail = SecurityUtil.getCurrentUser().orElseThrow(NotLoginException::new);
        List<PermMenuDto> permissions;

        //系统管理员，获取全部的权限
        if (userDetail.isAdmin()) {
            permissions = permMenuService.findAllByClientCode(clientCode);
        } else {
            // 非管理员获取自身拥有的权限
            permissions = this.findPermissionsByUser(userDetail.getId());
        }
        return permissions;
    }

    /**
     * 获取资源(权限码)列表(后端使用,直接获取所有终端的权限码)
     */
    @Cacheable(value = USER_PERM_CODE,key = "#userId")
    public List<String> findPermCodesByUserId(Long userId){
        // 获取关联的的权限码
        List<PermMenuDto> permissions = this.findPermissionsByUser(userId);
        return permissions.stream()
                .filter(o -> Objects.equals(o.getMenuType(), PermissionCode.MENU_TYPE_RESOURCE))
                .map(PermMenuDto::getPermCode)
                .collect(Collectors.toList());
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
     * @return 递归后的树列表
     */
    private List<PermMenuDto> recursiveBuildTree(List<PermMenuDto> permissions) {
        return TreeBuildUtil.build(permissions, null, BaseDto::getId,PermMenuDto::getParentId,PermMenuDto::setChildren,Comparator.comparingDouble(PermMenuDto::getSortNo));

    }

}

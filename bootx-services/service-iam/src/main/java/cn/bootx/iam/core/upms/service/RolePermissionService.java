package cn.bootx.iam.core.upms.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.iam.code.permission.PermissionCode;
import cn.bootx.iam.core.upms.dao.RolePermissionManager;
import cn.bootx.iam.core.upms.entity.RolePermission;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.dto.upms.PermissionDto;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
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
public class RolePermissionService {
    private final RolePermissionManager roleMenuManager;
    private final UserInfoManager userInfoManager;

    private final UserRoleService userRoleService;
    private final PermissionService permissionService;

    /**
     * 保存角色菜单授权
     */
    @Transactional(rollbackFor = Exception.class)
    public void add(Long roleId, List<Long> permissionIds){
        // 删旧增新
        roleMenuManager.deleteByRole(roleId);
        List<RolePermission> roleMenus = permissionIds.stream()
                .map(permissionId -> new RolePermission(roleId, permissionId))
                .collect(Collectors.toList());
        roleMenuManager.saveAll(roleMenus);
    }

    /**
     * 根据角色查询对应的权限id
     */
    public List<Long> findIdsByRole(Long roleId){
        List<RolePermission> rolePermissions = roleMenuManager.findAllByRole(roleId);
        return rolePermissions.stream()
                .map(RolePermission::getPermissionId)
                .collect(Collectors.toList());
    }

    /**
     * 根据角色查询对应的权限id
     */
    public List<PermissionDto> findByRole(Long roleId){
        List<RolePermission> rolePermissions = roleMenuManager.findAllByRole(roleId);
        List<Long> ids = rolePermissions.stream()
                .map(RolePermission::getPermissionId)
                .collect(Collectors.toList());

        return permissionService.findByIds(ids);
    }

    /**
     * 获取权限树
     */
    public List<PermissionDto> tree(){
        return recursiveBuildTree(this.findPermissions(), null);
    }

    /**
     * 获取菜单权限树, 不包含按钮权限
     */
    public List<PermissionDto> findMenuTree(){
        List<PermissionDto> permissions = this.findPermissions();
        List<PermissionDto> permissionsByNotButton = permissions.stream()
                .filter(o -> !Objects.equals(PermissionCode.MENU_TYPE_BUTTON, o.getMenuType()))
                .collect(Collectors.toList());
        return this.recursiveBuildTree(permissionsByNotButton, null);
    }

    /**
     * 获取按钮权限
     */
    public List<PermissionDto> findButtonPermission(){
        List<PermissionDto> permissions = this.findPermissions();
        return permissions.stream()
                .filter(o -> Objects.equals(PermissionCode.MENU_TYPE_BUTTON, o.getMenuType()))
                .collect(Collectors.toList());
    }

    /**
     * 获取按钮权限
     */
    private List<PermissionDto> findPermissions(){
//        UserDetail userDetail = SecurityUtil.getCurrentUser().orElseThrow(() -> new BizException("未登录"));
//        UserInfo userInfo = userInfoManager.findById(userDetail.getId()).orElseThrow(() -> new BizException("用户不存在"));

        UserInfo userInfo = userInfoManager.findById(1399985191002447872L).orElseThrow(() -> new BizException("用户不存在"));
        List<PermissionDto> permissions;

        //系统管理员，获取全部的菜单
        if (userInfo.isAdmin()) {
            permissions = permissionService.findAll();
        } else {
            // 非管理员获取自身拥有权限的菜单
            permissions = this.findPermissionsByUser(userInfo.getId());
        }
        return permissions;
    }


    /**
     * 查询用户查询拥有的权限信息
     */
    public List<PermissionDto> findPermissionsByUser(Long userId){
        List<PermissionDto> permissions = new ArrayList<>(0);

        List<Long> roleIds = userRoleService.findRoleIdsByUser(userId);
        if (CollUtil.isEmpty(roleIds)){
            return permissions;
        }
        List<RolePermission> rolePermissions = roleMenuManager.findAllByRoles(roleIds);
        List<Long> permissionIds = rolePermissions.stream()
                .map(RolePermission::getPermissionId)
                .distinct()
                .collect(Collectors.toList());
        if (CollUtil.isNotEmpty(permissionIds)){
            permissions = permissionService.findByIds(permissionIds);
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
    private List<PermissionDto> recursiveBuildTree(List<PermissionDto> permissions, Long parentId) {
        List<PermissionDto> children = permissions.stream()
                .filter(m -> Objects.equals(m.getParentId(),parentId))
                .collect(Collectors.toList());
        if (CollectionUtil.isEmpty(children)) {
            return null;
        }
        for (PermissionDto permission : children) {
            permission.setChildren(recursiveBuildTree(permissions, permission.getId()));
        }
        return children;
    }
}

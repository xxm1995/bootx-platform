package cn.bootx.iam.core.upms.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.iam.core.permission.service.PermissionPathService;
import cn.bootx.iam.core.upms.dao.RolePathManager;
import cn.bootx.iam.core.upms.entity.RolePath;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.dto.permission.PermissionPathDto;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


/**
 * 角色路径权限关系
 * @author xxm
 * @date 2021/6/9
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class RolePathService {
    private final RolePathManager rolePathManager;
    private final PermissionPathService pathService;
    private final UserInfoManager userInfoManager;

    private final UserRoleService userRoleService;

    /**
     * 保存角色路径授权
     */
    @Transactional(rollbackFor = Exception.class)
    public void addRolePath(Long roleId, List<Long> permissionIds) {
        // 删旧增新
        rolePathManager.deleteByRole(roleId);

        List<RolePath> rolePermissions = permissionIds.stream()
                .map(permissionId -> new RolePath(roleId, permissionId))
                .collect(Collectors.toList());
        rolePathManager.saveAll(rolePermissions);
    }

    /**
     * 添加路径角色
     */
    @Transactional(rollbackFor = Exception.class)
    public void save(Long permissionId, List<Long> roleIds){
        // 删旧增新
        rolePathManager.deleteByPermission(permissionId);

        List<RolePath> rolePermissions = roleIds.stream()
                .map(roleId -> new RolePath(roleId, permissionId))
                .collect(Collectors.toList());
        rolePathManager.saveAll(rolePermissions);
    }


    /**
     * 查询用户查询拥有的权限信息
     */
    public List<PermissionPathDto> findPathsByUser(){
        Long userId = SecurityUtil.getUserId();
        return this.findPathsByUser(userId);
    }

    /**
     * 查询用户查询拥有的路径权限信息
     */
    public List<PermissionPathDto> findPathsByUser(Long userId){
        UserInfo userInfo = userInfoManager.findById(userId).orElseThrow(() -> new BizException("用户不存在"));

        List<PermissionPathDto> paths;
        if (userInfo.isAdmin()){
            paths = pathService.findAll();
        } else {
            paths = this.findPermissionsByUser(userId);
        }
        return paths;
    }


    /**
     * 查询用户查询拥有的权限信息
     */
    public List<PermissionPathDto> findPermissionsByUser(Long userId){
        List<PermissionPathDto> permissions = new ArrayList<>(0);

        List<Long> roleIds = userRoleService.findRoleIdsByUser(userId);
        if (CollUtil.isEmpty(roleIds)){
            return permissions;
        }
        List<RolePath> rolePaths = rolePathManager.findAllByRoles(roleIds);
        List<Long> permissionIds = rolePaths.stream()
                .map(RolePath::getPermissionId)
                .distinct()
                .collect(Collectors.toList());
        if (CollUtil.isNotEmpty(permissionIds)){
            permissions = pathService.findByIds(permissionIds);
        }
        return permissions;
    }

    /**
     * 根据角色id获取关联权限id
     */
    public List<Long> findIdsByRole(Long roleId) {
        List<RolePath> rolePermissions = rolePathManager.findAllByRole(roleId);
        return rolePermissions.stream()
                .map(RolePath::getPermissionId)
                .collect(Collectors.toList());
    }
}

package cn.bootx.iam.core.upms.service;

import cn.bootx.common.core.annotation.CountTime;
import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.iam.core.permission.service.PermPathService;
import cn.bootx.iam.core.upms.dao.RolePathManager;
import cn.bootx.iam.core.upms.entity.RolePath;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.dto.permission.PermPathDto;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.extra.spring.SpringUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import static cn.bootx.iam.code.CachingCode.USER_PATH;


/**
 * 角色请求权限关系
 * @author xxm
 * @date 2021/6/9
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class RolePathService {
    private final RolePathManager rolePathManager;
    private final PermPathService pathService;
    private final UserInfoManager userInfoManager;

    private final UserRoleService userRoleService;

    /**
     * 保存角色路径授权
     */
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(value = {USER_PATH},allEntries = true)
    @CountTime
    public void addRolePath(Long roleId, List<Long> permissionIds) {
        // 先删后增
        List<RolePath> rolePaths = rolePathManager.findAllByRole(roleId);
        List<Long> rolePathIds = rolePaths.stream().map(RolePath::getPermissionId).collect(Collectors.toList());
        // 需要删除的
        List<Long> deleteIds = rolePaths.stream()
                .filter(rolePath -> !permissionIds.contains(rolePath.getPermissionId()))
                .map(MpIdEntity::getId)
                .collect(Collectors.toList());

        List<RolePath> rolePermissions = permissionIds.stream()
                .filter(id->!rolePathIds.contains(id))
                .map(permissionId -> new RolePath(roleId, permissionId))
                .collect(Collectors.toList());
        rolePathManager.deleteByIds(deleteIds);
        rolePathManager.saveAll(rolePermissions);
    }

    /**
     * 查询用户查询拥有的请求权限信息
     */
    public List<PermPathDto> findPathsByUser(){
        Long userId = SecurityUtil.getUserId();
        return this.findPathsByUser(userId);
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

    /**
     * 查询用户拥有的路径权限信息( 路径路由拦截使用 )
     */
    @Cacheable(value = USER_PATH,key = "#method+':'+#userId")
    public List<String> findSimplePathsByUser(String method,Long userId){
        return SpringUtil.getBean(this.getClass()).findPathsByUser(userId).stream()
                .filter(permPathDto -> Objects.equals(method,permPathDto.getRequestType()))
                .map(PermPathDto::getPath)
                .collect(Collectors.toList());
    }

    /**
     * 查询用户拥有的路径权限信息
     */
    public List<PermPathDto> findPathsByUser(Long userId){
        UserInfo userInfo = userInfoManager.findById(userId).orElseThrow(() -> new BizException("用户不存在"));

        List<PermPathDto> paths;
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
    private List<PermPathDto> findPermissionsByUser(Long userId){
        List<PermPathDto> permissions = new ArrayList<>(0);

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

}

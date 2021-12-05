package cn.bootx.iam.core.upms.service;

import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.iam.core.upms.dao.RoleManager;
import cn.bootx.iam.core.upms.dao.UserRoleManager;
import cn.bootx.iam.core.upms.entity.UserRole;
import cn.bootx.iam.dto.upms.RoleDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 用户角色关系
 * @author xxm
 * @date 2021/8/3
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class UserRoleService {

    private final RoleManager roleManager;
    private final UserRoleManager userRoleManager;

    /**
     * 给用户分配角色
     */
    @Transactional(rollbackFor = Exception.class)
    public void saveAndUpdate(Long userId, List<Long> roleIds){
        // 先删除用户拥有的角色
        userRoleManager.deleteByUser(userId);
        // 然后给用户添加角色
        List<UserRole> userRoles = roleIds.stream()
                .map(roleId -> new UserRole().setRoleId(roleId).setUserId(userId))
                .collect(Collectors.toList());
        userRoleManager.saveAll(userRoles);
    }

    /**
     * 根据id查询角色id
     */
    public List<Long> findRoleIdsByUser(Long userId) {
        return userRoleManager.findRoleIdsByUser(userId).stream()
                .map(UserRole::getRoleId)
                .distinct()
                .collect(Collectors.toList());
    }


    /**
     * 查询用户所对应的角色
     */
    public List<RoleDto> findRolesByUser(Long userId){
        return ResultConvertUtil.dtoListConvert(roleManager.findAllByIds(this.findRoleIdsByUser(userId)));
    }

}

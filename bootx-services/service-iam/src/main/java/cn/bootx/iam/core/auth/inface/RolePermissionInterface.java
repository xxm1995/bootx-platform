package cn.bootx.iam.core.auth.inface;

import cn.bootx.iam.core.upms.service.RolePathService;
import cn.bootx.iam.core.upms.service.UserRoleService;
import cn.bootx.iam.dto.permission.PermissionPathDto;
import cn.bootx.iam.dto.upms.RoleDto;
import cn.dev33.satoken.stp.StpInterface;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

/**
* 安全框架角色权限获取类
* @author xxm
* @date 2021/8/25
*/
@Component
@RequiredArgsConstructor
public class RolePermissionInterface implements StpInterface {
    private final UserRoleService userRoleService;
    private final RolePathService rolePathService;

    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        return rolePathService.findPathsByUser((Long) loginId).stream()
                .map(PermissionPathDto::getCode)
                .collect(Collectors.toList());
    }

    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        return userRoleService.findRolesByUser((Long) loginId).stream()
                .map(RoleDto::getCode)
                .collect(Collectors.toList());
    }
}

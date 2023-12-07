package cn.bootx.platform.iam.controller;

import cn.bootx.platform.common.core.annotation.IgnoreAuth;
import cn.bootx.platform.common.core.rest.Res;
import cn.bootx.platform.common.core.rest.ResResult;
import cn.bootx.platform.common.core.util.ValidationUtil;
import cn.bootx.platform.iam.core.upms.service.RolePermService;
import cn.bootx.platform.iam.dto.upms.MenuAndResourceDto;
import cn.bootx.platform.iam.param.upms.RolePermissionParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 角色权限(菜单)关联关系
 *
 * @author xxm
 * @since 2021/7/12
 */
@Tag(name = "角色菜单权限关系")
@RestController
@RequestMapping("/role/menu")
@RequiredArgsConstructor
public class RoleMenuController {

    private final RolePermService rolePermService;

    @Operation(summary = "保存请求权限关系")
    @PostMapping("/save")
    public ResResult<Boolean> save(@RequestBody RolePermissionParam param) {
        ValidationUtil.validateParam(param, RolePermissionParam.PermMenu.class);
        rolePermService.saveRoleMenu(param.getRoleId(), param.getClientCode(), param.getPermissionIds(),param.isUpdateChildren());
        return Res.ok(true);
    }

    @Operation(summary = "获取权限菜单id列表,不包含资源权限")
    @GetMapping("/findMenuIds")
    public ResResult<List<Long>> findMenuIds(String clientCode) {
        return Res.ok(rolePermService.findMenuIds(clientCode));
    }

    @Operation(summary = "根据角色id获取关联权限id集合(包含资源和菜单)")
    @GetMapping("/findPermissionIdsByRole")
    public ResResult<List<Long>> findPermissionIdsByRole(Long roleId, String clientCode) {
        return Res.ok(rolePermService.findPermissionIdsByRole(roleId, clientCode));
    }

    @IgnoreAuth
    @Operation(summary = "获取菜单和资源权限")
    @GetMapping("/getPermissions")
    public ResResult<MenuAndResourceDto> getPermissions(String clientCode) {
        return Res.ok(rolePermService.getPermissions(clientCode));
    }

}

package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.iam.core.upms.service.RoleMenuService;
import cn.bootx.iam.dto.permission.PermissionMenuDto;
import cn.bootx.iam.dto.upms.UserMenuAndButtonDto;
import cn.bootx.iam.param.upms.RolePermissionParam;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**   
* 角色权限(菜单)关联关系
* @author xxm  
* @date 2021/7/12 
*/
@Tag(name ="角色菜单权限关系")
@RestController
@RequestMapping("/role/menu")
@RequiredArgsConstructor
public class RoleMenuController {
    private final RoleMenuService roleMenuService;

    @Operation(summary = "保存请求权限关系")
    @PostMapping("/save")
    public ResResult<Boolean> save(@RequestBody RolePermissionParam param){
        roleMenuService.save(param.getRoleId(),param.getPermissionIds());
        return Res.ok(true);
    }

    @Operation(summary = "获取菜单树, 不包含按钮权限")
    @GetMapping("/findMenuTree")
    public ResResult<List<PermissionMenuDto>> findMenuTree(){
        return Res.ok(roleMenuService.findMenuTree());
    }

    @Operation(summary = "获取权限菜单id列表,不包含按钮权限")
    @GetMapping("/findMenuIds")
    public ResResult<List<Long>> findMenuIds(){
        return Res.ok(roleMenuService.findMenuIds());
    }

    @Operation(summary = "获取按钮权限, 不包含菜单权限")
    @GetMapping("/findButtonPermission")
    public ResResult<List<String>> findButtonPermission(){
        return Res.ok(roleMenuService.findButtonPermission());
    }

    @Operation(summary = "根据角色id获取关联权限id")
    @GetMapping("/findIdsByRole")
    public ResResult<List<Long>> findIdsByRole(Long roleId){
        return Res.ok(roleMenuService.findIdsByRole(roleId));
    }

    @Operation(summary = "获取菜单和按钮权限")
    @GetMapping("/findMenuAndButtonPermission")
    public ResResult<UserMenuAndButtonDto> findMenuAndButtonPermission(){
        return Res.ok(roleMenuService.findMenuAndButtonPermission());
    }
}

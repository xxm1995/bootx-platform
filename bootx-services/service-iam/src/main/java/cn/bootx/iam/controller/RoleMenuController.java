package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.iam.core.upms.service.RoleMenuService;
import cn.bootx.iam.dto.permission.PermissionMenuDto;
import cn.bootx.iam.dto.upms.UserMenuAndButtonDto;
import cn.bootx.iam.param.upms.RolePermissionParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**   
* 角色权限(菜单)关联关系
* @author xxm  
* @date 2021/7/12 
*/
@Api(tags = "角色菜单权限关系")
@RestController
@RequestMapping("/role/menu")
@RequiredArgsConstructor
public class RoleMenuController {
    private final RoleMenuService rolePermissionService;

    @ApiOperation("保存请求权限关系")
    @PostMapping("/save")
    public ResResult<Boolean> save(@RequestBody RolePermissionParam param){
        rolePermissionService.save(param.getRoleId(),param.getPermissionIds());
        return Res.ok(true);
    }

    @ApiOperation("获取菜单树, 不包含按钮权限")
    @GetMapping("/findMenuTree")
    public ResResult<List<PermissionMenuDto>> findMenuTree(){
        return Res.ok(rolePermissionService.findMenuTree());
    }

    @ApiOperation("获取按钮权限, 不包含菜单权限")
    @GetMapping("/findButtonPermission")
    public ResResult<List<String>> findButtonPermission(){
        return Res.ok(rolePermissionService.findButtonPermission());
    }

    @ApiOperation("根据角色id获取关联权限id")
    @GetMapping("/findIdsByRole")
    public ResResult<List<Long>> findIdsByRole(Long roleId){
        return Res.ok(rolePermissionService.findIdsByRole(roleId));
    }

    @ApiOperation("获取菜单和按钮权限")
    @GetMapping("/findMenuAndButtonPermission")
    public ResResult<UserMenuAndButtonDto> findMenuAndButtonPermission(){
        return Res.ok(rolePermissionService.findMenuAndButtonPermission());
    }
}

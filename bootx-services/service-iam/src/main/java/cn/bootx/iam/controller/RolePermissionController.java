package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.iam.core.upms.service.RolePermissionService;
import cn.bootx.iam.dto.upms.PermissionDto;
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
@RequestMapping("/role/permission")
@RequiredArgsConstructor
public class RolePermissionController {
    private final RolePermissionService rolePermissionService;

    @ApiOperation("保存请求权限关系")
    @PostMapping("/save")
    public ResResult<Boolean> save(@RequestBody RolePermissionParam param){
        rolePermissionService.save(param.getRoleId(),param.getPermissionIds());
        return Res.ok(true);
    }

    @ApiOperation("根据角色id获取权限id")
    @GetMapping("/findIdsByRole")
    public ResResult<List<Long>> findIdsByRole(Long roleId){
        return Res.ok(rolePermissionService.findIdsByRole(roleId));
    }

    @ApiOperation("获取菜单树, 不包含按钮权限")
    @GetMapping("/findMenuTree")
    public ResResult<List<PermissionDto>> findMenuTree(){
        return Res.ok(rolePermissionService.findMenuTree());
    }

    @ApiOperation("获取按钮权限, 不包含菜单权限")
    @GetMapping("/findButtonPermission")
    public ResResult<List<PermissionDto>> findButtonPermission(){
        return Res.ok(rolePermissionService.findButtonPermission());
    }
}

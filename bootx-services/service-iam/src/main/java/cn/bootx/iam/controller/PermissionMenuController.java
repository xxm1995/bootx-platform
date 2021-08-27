package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.iam.core.permission.service.PermissionMenuService;
import cn.bootx.iam.core.upms.service.RoleMenuService;
import cn.bootx.iam.dto.permission.PermissionMenuDto;
import cn.bootx.iam.param.permission.PermissionMenuParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author xxm
 * @date 2020/5/11 9:36
 */
@Api(tags = "菜单权限资源")
@RestController
@RequestMapping("/permission/menu")
@RequiredArgsConstructor
public class PermissionMenuController {
    private final PermissionMenuService permissionService;
    private final RoleMenuService rolePermissionService;

    @ApiOperation("添加菜单权限")
    @PostMapping("/add")
    public ResResult<PermissionMenuDto> add(@RequestBody PermissionMenuParam param){
        return Res.ok(permissionService.add(param));
    }

    @ApiOperation("修改菜单权限")
    @PostMapping("/update")
    public ResResult<PermissionMenuDto> update(@RequestBody PermissionMenuParam param){
        return Res.ok(permissionService.update(param));
    }

    @ApiOperation("获取权限树")
    @GetMapping("/tree")
    public ResResult<List<PermissionMenuDto>> tree(){
        return Res.ok(rolePermissionService.tree());
    }

    @ApiOperation("根据id查询")
    @GetMapping("/findById")
    public ResResult<PermissionMenuDto> findById(Long id){
        return Res.ok(permissionService.findById(id));
    }

    @ApiOperation("根据id查询")
    @DeleteMapping("/delete")
    public ResResult<Void> delete(Long id){
        permissionService.delete(id);
        return Res.ok();
    }
}

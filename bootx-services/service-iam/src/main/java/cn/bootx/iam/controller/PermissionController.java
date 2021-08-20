package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.iam.core.upms.service.PermissionService;
import cn.bootx.iam.core.upms.service.RolePermissionService;
import cn.bootx.iam.dto.upms.PermissionDto;
import cn.bootx.iam.param.upms.PermissionParam;
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
@RequestMapping("/permission")
@RequiredArgsConstructor
public class PermissionController {
    private final PermissionService permissionService;
    private final RolePermissionService rolePermissionService;

    @ApiOperation("添加菜单权限")
    @PostMapping("/add")
    public ResResult<PermissionDto> add(@RequestBody PermissionParam param){
        return Res.ok(permissionService.add(param));
    }

    @ApiOperation("修改菜单权限")
    @PostMapping("/update")
    public ResResult<PermissionDto> update(@RequestBody PermissionParam param){
        return Res.ok(permissionService.update(param));
    }

    @ApiOperation("获取权限树")
    @GetMapping("/tree")
    public ResResult<List<PermissionDto>> tree(){
        return Res.ok(rolePermissionService.tree());
    }

    @ApiOperation("根据id查询")
    @GetMapping("/findById")
    public ResResult<PermissionDto> findById(Long id){
        return Res.ok(permissionService.findById(id));
    }

    @ApiOperation("根据id查询")
    @DeleteMapping("/delete")
    public ResResult<Void> delete(Long id){
        permissionService.delete(id);
        return Res.ok();
    }
}

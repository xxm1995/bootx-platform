package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.iam.core.permission.service.PermMenuService;
import cn.bootx.iam.core.upms.service.RoleMenuService;
import cn.bootx.iam.dto.permission.PermMenuDto;
import cn.bootx.iam.param.permission.PermMenuParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author xxm
 * @date 2020/5/11 9:36
 */
@Tag(name ="菜单权限资源")
@RestController
@RequestMapping("/perm/menu")
@RequiredArgsConstructor
public class PermMenuController {
    private final PermMenuService permissionService;
    private final RoleMenuService rolePermissionService;

    @Operation(summary = "添加菜单权限")
    @PostMapping("/add")
    public ResResult<PermMenuDto> add(@RequestBody PermMenuParam param){
        return Res.ok(permissionService.add(param));
    }

    @Operation(summary = "修改菜单权限")
    @PostMapping("/update")
    public ResResult<PermMenuDto> update(@RequestBody PermMenuParam param){
        return Res.ok(permissionService.update(param));
    }

    @Operation(summary = "获取权限菜单树")
    @GetMapping("/tree")
    public ResResult<List<PermMenuDto>> tree(){
        return Res.ok(rolePermissionService.tree());
    }

    @Operation(summary = "根据id查询")
    @GetMapping("/findById")
    public ResResult<PermMenuDto> findById(Long id){
        return Res.ok(permissionService.findById(id));
    }


    @Operation(summary = "删除")
    @DeleteMapping("/delete")
    public ResResult<Void> delete(Long id){
        permissionService.delete(id);
        return Res.ok();
    }
}

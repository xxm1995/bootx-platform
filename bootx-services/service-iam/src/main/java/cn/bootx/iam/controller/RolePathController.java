package cn.bootx.iam.controller;

import cn.bootx.common.core.annotation.IgnoreAuth;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.iam.core.upms.service.RolePathService;
import cn.bootx.iam.dto.permission.PermPathDto;
import cn.bootx.iam.param.upms.RolePermissionParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* @author xxm
* @date 2021/6/9
*/
@Tag(name ="角色请求权限消息关系")
@RestController
@RequestMapping("/role/path")
@RequiredArgsConstructor
public class RolePathController {
    private final RolePathService rolePathService;

    @Operation(summary = "保存角色权限关联关系")
    @PostMapping("/save")
    public ResResult<Void> save(@RequestBody RolePermissionParam param){
        rolePathService.addRolePath(param.getRoleId(),param.getPermissionIds());
        return Res.ok();
    }

    @IgnoreAuth
    @Operation(summary = "根据用户id获取角色授权(请求权限列表)")
    @GetMapping("/findPathsByUser")
    public ResResult<List<PermPathDto>> findPathsByUser(){
        return Res.ok(rolePathService.findPathsByUser());
    }

    @IgnoreAuth
    @Operation(summary = "根据角色id获取关联权限id")
    @GetMapping("/findIdsByRole")
    public ResResult<List<Long>> findIdsByRole(Long roleId){
        return Res.ok(rolePathService.findIdsByRole(roleId));
    }
}

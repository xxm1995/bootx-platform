package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.util.ValidationUtil;
import cn.bootx.iam.core.upms.service.UserRoleService;
import cn.bootx.iam.dto.upms.RoleDto;
import cn.bootx.iam.param.upms.UserRoleParam;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* @author xxm
* @date 2020/5/1 18:09
*/
@Tag(name ="用户角色管理")
@RestController
@RequestMapping("/user/role")
@AllArgsConstructor
public class UserRoleController {

    private final UserRoleService userRoleService;

    @Parameter(name = "给用户分配角色")
    @PostMapping(value = "/saveAndUpdate")
    public ResResult<Boolean> saveAndUpdate(@RequestBody UserRoleParam param) {
        ValidationUtil.validateParam(param);
        userRoleService.saveAndUpdate(param.getUserId(), param.getRoleIds());
        return Res.ok(true);
    }

    @Parameter(name = "根据用户ID获取到角色集合")
    @GetMapping(value = "/findRolesByUser")
    public ResResult<List<RoleDto>> findRolesByUser(Long id) {
        return Res.ok(userRoleService.findRolesByUser(id));
    }

    @Parameter(name = "根据用户ID获取到角色id集合")
    @GetMapping(value = "/findRoleIdsByUser")
    public ResResult<List<Long>> findRoleIdsByUser(Long id) {
        return Res.ok(userRoleService.findRoleIdsByUser(id));
    }

}

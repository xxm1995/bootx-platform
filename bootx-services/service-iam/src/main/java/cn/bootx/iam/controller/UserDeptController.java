package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.iam.core.user.service.UserDeptService;
import cn.bootx.iam.dto.dept.DeptDto;
import cn.bootx.iam.dto.upms.RoleDto;
import cn.bootx.iam.param.user.UserDeptParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* @author xxm
* @date 2021/9/29
*/
@Api(tags = "用户部门关联关系")
@RestController
@RequestMapping("/user/dept")
@RequiredArgsConstructor
public class UserDeptController {
    private final UserDeptService userDeptService;

    @ApiOperation("给用户分配部门")
    @PostMapping("/saveAndUpdate")
    public ResResult<Void> saveAndUpdate(@RequestBody UserDeptParam userDeptParam){
        userDeptService.saveAndUpdate(userDeptParam.getUserId(), userDeptParam.getDeptIds());
        return Res.ok();
    }

    @ApiOperation(value = "根据用户ID获取到部门集合")
    @GetMapping(value = "/findDeptListByUser")
    public ResResult<List<DeptDto>> findDeptListByUser(Long id) {
        return Res.ok(userDeptService.findDeptListByUser(id));
    }

    @ApiOperation(value = "根据用户ID获取到部门id集合")
    @GetMapping(value = "/findDeptIdsByUser")
    public ResResult<List<Long>> findDeptIdsByUser(Long id) {
        return Res.ok(userDeptService.findDeptIdsByUser(id));
    }

}

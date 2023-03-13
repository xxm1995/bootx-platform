package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.util.ValidationUtil;
import cn.bootx.iam.core.upms.service.UserDataScopeService;
import cn.bootx.iam.dto.scope.DataScopeDto;
import cn.bootx.iam.param.upms.UserDataScopeBatchParam;
import cn.bootx.iam.param.upms.UserDataScopeParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author xxm
 * @date 2022/1/2
 */
@Tag(name = "用户数据权限配置")
@RestController
@RequestMapping("/user/data/scope")
@RequiredArgsConstructor
public class UserDataScopeController {

    private final UserDataScopeService dataScopeService;

    @Operation(summary = "给用户分配权限")
    @PostMapping("/saveAssign")
    public ResResult<Void> saveAssign(@RequestBody UserDataScopeParam param) {
        ValidationUtil.validateParam(param);
        dataScopeService.saveAssign(param.getUserId(), param.getDataScopeId());
        return Res.ok();
    }

    @Operation(summary = "给用户分配权限(批量)")
    @PostMapping("/saveAssignBatch")
    public ResResult<Void> saveAssignBatch(@RequestBody UserDataScopeBatchParam param) {
        dataScopeService.saveAssignBatch(param.getUserIds(), param.getDataScopeId());
        return Res.ok();
    }

    @Operation(summary = "根据用户ID获取到数据权限")
    @GetMapping(value = "/findDataScopeByUser")
    public ResResult<DataScopeDto> findDataScopeByUser(Long id) {
        return Res.ok(dataScopeService.findDataScopeByUser(id));
    }

    @Operation(summary = "根据用户ID获取到数据权限Id")
    @GetMapping(value = "/findDataScopeIdByUser")
    public ResResult<Long> findDataScopeIdByUser(Long id) {
        return Res.ok(dataScopeService.findDataScopeIdByUser(id));
    }

}

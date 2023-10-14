package cn.bootx.platform.iam.controller;

import cn.bootx.platform.common.core.rest.Res;
import cn.bootx.platform.common.core.rest.ResResult;
import cn.bootx.platform.iam.core.security.password.service.PasswordChangeHistoryService;
import cn.bootx.platform.iam.core.security.password.service.PasswordSecurityCheckService;
import cn.bootx.platform.iam.core.security.password.service.PasswordSecurityConfigService;
import cn.bootx.platform.iam.dto.security.PasswordSecurityConfigDto;
import cn.bootx.platform.iam.dto.security.passwordSecurityCheckResult;
import cn.bootx.platform.iam.param.security.PasswordSecurityConfigParam;
import cn.bootx.platform.starter.auth.util.SecurityUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 密码安全策略
 * @author xxm
 * @since 2023-09-20
 */
@Tag(name ="密码安全策略")
@RestController
@RequestMapping("/security/password")
@RequiredArgsConstructor
public class PasswordSecurityConfigController {
    private final PasswordSecurityConfigService passwordSecurityConfigService;
    private final PasswordChangeHistoryService passwordChangeHistoryService;
    private final PasswordSecurityCheckService passwordSecurityCheckService;

    @Operation( summary = "添加")
    @PostMapping(value = "/add")
    public ResResult<Void> add(@RequestBody PasswordSecurityConfigParam param){
        passwordSecurityConfigService.add(param);
        return Res.ok();
    }

    @Operation( summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<Void> update(@RequestBody PasswordSecurityConfigParam param){
        passwordSecurityConfigService.update(param);
        return Res.ok();
    }

    @Operation( summary = "获取配置")
    @GetMapping(value = "/getDefault")
    public ResResult<PasswordSecurityConfigDto> getDefault(){
        return Res.ok(passwordSecurityConfigService.getDefault());
    }

    @Operation(summary = "查看要修改的密码是否重复")
    @GetMapping("/isRecentlyUsed")
    public ResResult<Boolean> isRecentlyUsed(String password) {
        return Res.ok(passwordChangeHistoryService.isRecentlyUsed(SecurityUtil.getUserId(),password));
    }

    @Operation(summary = "登录后检查密码相关的情况")
    @GetMapping("/checkPasswordSecurity")
    public ResResult<passwordSecurityCheckResult> checkPasswordSecurity(){
        Long userId = SecurityUtil.getUserId();
        return Res.ok(passwordSecurityCheckService.checkPasswordSecurity(userId));
    }
}

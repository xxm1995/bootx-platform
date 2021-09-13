package cn.bootx.iam.controller;

import cn.bootx.common.core.annotation.IgnoreAuth;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.iam.core.auth.service.AuthAssistService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
*
* @author xxm
* @date 2021/9/9
*/
@Api(tags = "认证支撑接口")
@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthAssistController {
    private final AuthAssistService authAssistService;

    @IgnoreAuth
    @ApiOperation("发送短信验证码")
    @PostMapping("/sendSmsCaptcha")
    public ResResult<Void> sendSmsCaptcha(String phone){
        authAssistService.sendSmsCaptcha(phone);
        return Res.ok();
    }
}

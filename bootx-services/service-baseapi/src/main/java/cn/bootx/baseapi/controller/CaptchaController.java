package cn.bootx.baseapi.controller;

import cn.bootx.baseapi.core.captcha.service.CaptchaService;
import cn.bootx.baseapi.dto.captcha.CaptchaDataResult;
import cn.bootx.common.core.annotation.IgnoreAuth;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
* 验证码服务
* @author xxm
* @date 2021/8/2
*/
@Api(tags = "验证码服务")
@RestController
@RequestMapping("/captcha")
@RequiredArgsConstructor
public class CaptchaController {
    private final CaptchaService captchaService;

    @IgnoreAuth
    @ApiOperation("获取图片验证码")
    @PostMapping("/imgCaptcha")
    public ResResult<CaptchaDataResult> imgCaptcha(){
        return Res.ok(captchaService.imgCaptcha());
    }

    @IgnoreAuth
    @ApiOperation("发送短信验证码")
    @PostMapping("/sendSmsCaptcha")
    public ResResult<Void> sendSmsCaptcha(String phone){
        captchaService.sendSmsCaptcha(phone);
        return Res.ok();
    }

}

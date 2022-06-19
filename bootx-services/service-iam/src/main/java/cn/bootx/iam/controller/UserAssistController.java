package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.iam.core.user.service.UserAssistService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

/**   
* 用户操作支撑服务
* @author xxm  
* @date 2022/6/19 
*/
@Validated
@Tag(name = "用户操作支撑服务")
@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserAssistController {
    private final UserAssistService userAssistService;

    @Operation(summary = "给当前用户发送更改手机号验证码")
    @PostMapping("/sendCurrentPhoneCaptcha")
    public ResResult<Void> sendCurrentPhoneCaptcha(){
        userAssistService.sendCurrentPhoneCaptcha();
        return Res.ok();
    }

    @Operation(summary = "验证当前用户发送更改手机号验证码")
    @GetMapping("/validateCurrentPhoneCaptcha")
    public ResResult<Boolean> validateCurrentPhoneCaptcha(@NotBlank(message = "验证码不可为空") String captcha){
        return Res.ok(userAssistService.validateCurrentPhoneCaptcha(captcha));
    }

    @Operation(summary = "发送更改手机号验证码")
    @PostMapping("/sendPhoneCaptcha")
    public ResResult<Void> sendPhoneCaptcha(@NotBlank(message = "手机号不可为空") String phone){
        userAssistService.sendPhoneCaptcha(phone);
        return Res.ok();
    }

    @Operation(summary = "验证改手机验证码")
    @GetMapping("/validatePhoneCaptcha")
    public ResResult<Boolean> validatePhoneCaptcha(
            @NotBlank(message = "手机号不可为空") String phone,
            @NotBlank(message = "验证码不可为空") String captcha){
        return Res.ok(userAssistService.validatePhoneCaptcha(phone,captcha));
    }

    @Operation(summary = "给当前用户发送更改邮箱验证码")
    @PostMapping("/sendCurrentEmailCaptcha")
    public ResResult<Void> sendCurrentEmailCaptcha(){
        userAssistService.sendCurrentEmailCaptcha();
        return Res.ok();
    }

    @Operation(summary = "验证当前用户发送更改邮箱验证码")
    @GetMapping("/validateCurrentEmailCaptcha")
    public ResResult<Boolean> validateCurrentEmailCaptcha(@NotBlank(message = "验证码不可为空") String captcha){
        return Res.ok(userAssistService.validateCurrentEmailCaptcha(captcha));
    }

    @Operation(summary = "发送更改邮箱验证码")
    @PostMapping("/sendEmailCaptcha")
    public ResResult<Void> sendEmailCaptcha(@NotBlank(message = "邮箱不可为空")@Email String email){
        userAssistService.sendEmailCaptcha(email);
        return Res.ok();
    }

    @Operation(summary = "验证更改邮箱验证码")
    @GetMapping("/validateEmailCaptcha")
    public ResResult<Boolean> validateEmailCaptcha(
            @NotBlank(message = "验证码不可为空") String email,
            @NotBlank(message = "验证码不可为空") String captcha){
        return Res.ok(userAssistService.validateEmailCaptcha(email,captcha));
    }

}

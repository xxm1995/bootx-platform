package cn.bootx.iam.core.auth.service;

import cn.bootx.baseapi.core.captcha.service.CaptchaService;
import cn.bootx.common.core.util.RegexUtil;
import cn.bootx.iam.core.user.service.UserInfoService;
import cn.bootx.iam.dto.user.UserInfoDto;
import cn.bootx.starter.auth.authentication.UsernamePasswordAuthentication;
import cn.bootx.starter.auth.config.AuthProperties;
import cn.bootx.starter.auth.entity.AuthInfoResult;
import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.starter.auth.exception.LoginFailureException;
import cn.bootx.starter.auth.exception.UserNotFoundException;
import cn.bootx.starter.auth.util.PasswordEncoder;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotNull;
import java.util.Objects;

/**
* 账号密码登陆方式实现
* @author xxm
* @date 2021/8/2
*/
@Slf4j
@Component
@RequiredArgsConstructor
public class PasswordLoginHandler implements UsernamePasswordAuthentication {

    private String usernameParameter = "account";
    private String passwordParameter = "password";
    private String clientParameter = "client";
    // 前端传入的验证码
    private String captchaParameter = "captcha";
    // 前端传入的验证码的key
    private String captchaKeyParameter = "captchaKey";

    private final AuthProperties authProperties;
    private final PasswordEncoder passwordEncoder;
    private final UserInfoService userInfoService;
    private final CaptchaService captchaService;

    /**
     * 认证前置操作, 默认处理验证码
     */
    @Override
    public void authenticationBefore(HttpServletRequest request, HttpServletResponse response){
        // 开启验证码验证
        if (authProperties.isCaptcha()){
            String captcha = this.obtainCaptcha(request);
            String captchaKey = this.obtainCaptchaKey(request);
            if (!captchaService.validateImgCaptcha(captchaKey,captcha)){
                String username = this.obtainUsername(request);
                throw new LoginFailureException(username,"验证码不正确");
            }
        }
    }

    /**
     * 认证
     */
    @Override
    public @NotNull AuthInfoResult attemptAuthentication(HttpServletRequest request, HttpServletResponse response) {
        String username = this.obtainUsername(request);
        String password = this.obtainPassword(request);
        UserDetail userDetail = this.loadUserByUsername(username);
        String client = this.obtainClient(request);
        String saltPassword = passwordEncoder.encode(password);
        // 比对密码未通过
        if (!Objects.equals(saltPassword,userDetail.getPassword())){
            throw new LoginFailureException(username,"密码不正确");
        }
        // 验证账号合法性
        validationUserDetails(userDetail,request,response);
        return new AuthInfoResult()
                .setId(userDetail.getId())
                .setUserDetail(userDetail)
                .setClient(client);
    }

    /**
     * 认证后操作
     */
    @Override
    public void authenticationAfter(AuthInfoResult authInfoResult,HttpServletRequest request, HttpServletResponse response){
        String captchaKey = this.obtainCaptchaKey(request);
        captchaService.deleteImgCaptcha(captchaKey);
    }

    /**
     * 验证用户是否合法
     */
    public void validationUserDetails(UserDetail userDetails, HttpServletRequest request, HttpServletResponse response){
    }

    /**
     * 根据账号获取密码
     */
    public UserDetail loadUserByUsername(String username) throws UserNotFoundException {

        UserInfoDto userInfoDto;
        // 1. 获取账号密码
        if (RegexUtil.isEmailPattern(username)) {
            // 根据 Email 获取用户信息
            userInfoDto = userInfoService.findByEmail(username);
        } else if (RegexUtil.isPhonePattern(username)) {
            // 根据 手机号 获取用户信息
            userInfoDto = userInfoService.findByPhone(username);
        } else {
            // 根据 账号 获取账户信息
            userInfoDto = userInfoService.findByAccount(username);
        }
        if (Objects.isNull(userInfoDto)){
            throw new UserNotFoundException(username);
        }
        return new UserDetail(userInfoDto.getId(),userInfoDto.getName(),userInfoDto.getUsername(),userInfoDto.getPassword());
    }

    @Nullable
    protected String obtainPassword(HttpServletRequest request) {
        return request.getParameter(this.passwordParameter);
    }

    @Nullable
    protected String obtainUsername(HttpServletRequest request) {
        return request.getParameter(this.usernameParameter);
    }

    @Nullable
    protected String obtainCaptcha(HttpServletRequest request) {
        return request.getParameter(this.captchaParameter);
    }
    @Nullable
    protected String obtainCaptchaKey(HttpServletRequest request) {
        return request.getParameter(this.captchaKeyParameter);
    }
    @Nullable
    protected String obtainClient(HttpServletRequest request) {
        return request.getParameter(this.clientParameter);
    }


    public void setUsernameParameter(String usernameParameter) {
        Assert.hasText(usernameParameter, "用户名参数不能为空或为空");
        this.usernameParameter = usernameParameter;
    }

    public void setPasswordParameter(String passwordParameter) {
        Assert.hasText(passwordParameter, "密码参数不能为空或为空");
        this.passwordParameter = passwordParameter;
    }

    public void setCaptchaParameter(String captchaParameter) {
        Assert.hasText(captchaParameter, "验证码参数不能为空或为空");
        this.captchaParameter = captchaParameter;
    }

    public void setCaptchaKeyParameter(String captchaKeyParameter) {
        Assert.hasText(captchaKeyParameter, "验证码key参数不能为空或为空");
        this.captchaKeyParameter = captchaKeyParameter;
    }

    public void setClientKeyParameter(String clientParameter) {
        Assert.hasText(clientParameter, "终端类型参数不能为空或为空");
        this.clientParameter = clientParameter;
    }

}

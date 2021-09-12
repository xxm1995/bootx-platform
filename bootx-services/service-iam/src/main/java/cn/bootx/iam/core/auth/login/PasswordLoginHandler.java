package cn.bootx.iam.core.auth.login;

import cn.bootx.baseapi.core.captcha.service.CaptchaService;
import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.RegexUtil;
import cn.bootx.iam.core.user.service.UserAdminService;
import cn.bootx.iam.dto.user.UserInfoDto;
import cn.bootx.starter.auth.authentication.UsernamePasswordAuthentication;
import cn.bootx.starter.auth.config.AuthProperties;
import cn.bootx.starter.auth.entity.AuthClient;
import cn.bootx.starter.auth.entity.AuthInfoResult;
import cn.bootx.starter.auth.exception.LoginFailureException;
import cn.bootx.starter.auth.exception.UserNotFoundException;
import cn.bootx.starter.auth.util.PasswordEncoder;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;

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
@SuppressWarnings("FieldCanBeLocal")
public class PasswordLoginHandler implements UsernamePasswordAuthentication {

    private final String USERNAME_PARAMETER = "account";
    private final String PASSWORD_PARAMETER = "password";
    // 前端传入的验证码
    private final String CAPTCHA_PARAMETER = "captcha";
    // 前端传入的验证码的key
    private final String CAPTCHA_KEY_PARAMETER = "captchaKey";

    private final AuthProperties authProperties;
    private final PasswordEncoder passwordEncoder;
    private final UserAdminService userAdminService;
    private final CaptchaService captchaService;

    /**
     * 认证前置操作, 默认处理验证码
     */
    @Override
    public void authenticationBefore(HttpServletRequest request, HttpServletResponse response, AuthClient authClient){
        // 开启验证码验证
        if (authClient.isCaptcha()){
            String captcha = this.obtainCaptcha(request);
            String captchaKey = this.obtainCaptchaKey(request);
            if (StrUtil.isBlank(captcha)){
                throw new BizException("验证码为空");
            }
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
    public @NotNull AuthInfoResult attemptAuthentication(HttpServletRequest request, HttpServletResponse response, AuthClient authClient) {
        String username = this.obtainUsername(request);
        String password = this.obtainPassword(request);
        UserDetail userDetail = this.loadUserByUsername(username);
        String saltPassword = passwordEncoder.encode(password);
        // 比对密码未通过
        if (!Objects.equals(saltPassword,userDetail.getPassword())){
            throw new LoginFailureException(username,"密码不正确");
        }
        return new AuthInfoResult()
                .setId(userDetail.getId())
                .setUserDetail(userDetail);
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
     * 根据账号获取密码
     */
    public UserDetail loadUserByUsername(String username) throws UserNotFoundException {
        UserInfoDto userInfoDto;
        // 1. 获取账号密码
        if (RegexUtil.isEmailPattern(username)) {
            // 根据 Email 获取用户信息
            userInfoDto = userAdminService.findByEmail(username);
        } else if (RegexUtil.isPhonePattern(username)) {
            // 根据 手机号 获取用户信息
            userInfoDto = userAdminService.findByPhone(username);
        } else {
            // 根据 账号 获取账户信息
            userInfoDto = userAdminService.findByAccount(username);
        }
        if (Objects.isNull(userInfoDto)){
            throw new UserNotFoundException(username);
        }
        return userInfoDto.toUserDetail();
    }

    @Nullable
    protected String obtainPassword(HttpServletRequest request) {
        return request.getParameter(this.PASSWORD_PARAMETER);
    }

    @Nullable
    protected String obtainUsername(HttpServletRequest request) {
        return request.getParameter(this.USERNAME_PARAMETER);
    }

    @Nullable
    protected String obtainCaptcha(HttpServletRequest request) {
        return request.getParameter(this.CAPTCHA_PARAMETER);
    }
    @Nullable
    protected String obtainCaptchaKey(HttpServletRequest request) {
        return request.getParameter(this.CAPTCHA_KEY_PARAMETER);
    }
}

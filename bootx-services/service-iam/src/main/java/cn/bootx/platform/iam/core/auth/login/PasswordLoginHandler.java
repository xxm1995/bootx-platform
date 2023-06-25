package cn.bootx.platform.iam.core.auth.login;

import cn.bootx.platform.common.core.entity.UserDetail;
import cn.bootx.platform.common.core.exception.BizException;
import cn.bootx.platform.common.core.util.RegexUtil;
import cn.bootx.platform.iam.core.user.service.UserAdminService;
import cn.bootx.platform.iam.core.user.service.UserQueryService;
import cn.bootx.platform.starter.auth.authentication.UsernamePasswordAuthentication;
import cn.bootx.platform.starter.auth.entity.AuthInfoResult;
import cn.bootx.platform.starter.auth.entity.AuthLoginType;
import cn.bootx.platform.starter.auth.entity.LoginAuthContext;
import cn.bootx.platform.starter.auth.exception.LoginFailureException;
import cn.bootx.platform.starter.auth.exception.UserNotFoundException;
import cn.bootx.platform.starter.auth.util.PasswordEncoder;
import cn.bootx.platform.baseapi.core.captcha.service.CaptchaService;
import cn.bootx.platform.iam.code.UserStatusCode;
import cn.bootx.platform.iam.dto.user.UserInfoDto;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotNull;
import java.util.Objects;

/**
 * 账号密码登陆方式实现
 *
 * @author xxm
 * @since 2021/8/2
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

    private final PasswordEncoder passwordEncoder;

    private final UserAdminService userAdminService;

    private final UserQueryService userQueryService;

    private final CaptchaService captchaService;

    /**
     * 认证前置操作, 默认处理验证码
     */
    @Override
    public void authenticationBefore(LoginAuthContext context) {
        AuthLoginType authLoginType = context.getAuthLoginType();
        HttpServletRequest request = context.getRequest();
        // 开启验证码验证
        if (authLoginType.isCaptcha()) {
            String captcha = this.obtainCaptcha(request);
            String captchaKey = this.obtainCaptchaKey(request);
            if (StrUtil.isBlank(captcha)) {
                throw new BizException("验证码为空");
            }
            if (!captchaService.validateImgCaptcha(captchaKey, captcha)) {
                String username = this.obtainUsername(request);
                throw new LoginFailureException(username, "验证码不正确");
            }
        }
    }

    /**
     * 认证
     */
    @Override
    public @NotNull AuthInfoResult attemptAuthentication(LoginAuthContext context) {
        String username = this.obtainUsername(context.getRequest());
        String password = this.obtainPassword(context.getRequest());
        UserDetail userDetail = this.loadUserByUsername(username);
        String saltPassword = passwordEncoder.encode(password);
        // 比对密码未通过
        if (!Objects.equals(saltPassword, userDetail.getPassword())) {
            this.passwordError(userDetail, context);
        }
        // 管理员跳过各种校验
        if (!userDetail.isAdmin()) {
            // 账号状态
            if (Objects.equals(userDetail.getStatus(), UserStatusCode.LOCK)) {
                throw new LoginFailureException(username, "密码多次输入错误，已被冻结");
            }
            if (!Objects.equals(userDetail.getStatus(), UserStatusCode.NORMAL)) {
                throw new LoginFailureException(username, "账号不是正常状态,无法登陆");
            }
        }
        return new AuthInfoResult().setId(userDetail.getId()).setUserDetail(userDetail);
    }

    /**
     * 认证后操作
     */
    @Override
    public void authenticationAfter(AuthInfoResult authInfoResult, LoginAuthContext context) {
        String captchaKey = this.obtainCaptchaKey(context.getRequest());
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
            userInfoDto = userQueryService.findByEmail(username);
        }
        else if (RegexUtil.isPhonePattern(username)) {
            // 根据 手机号 获取用户信息
            userInfoDto = userQueryService.findByPhone(username);
        }
        else {
            // 根据 账号 获取账户信息
            userInfoDto = userQueryService.findByAccount(username);
        }
        if (Objects.isNull(userInfoDto)) {
            throw new UserNotFoundException(username);
        }
        return userInfoDto.toUserDetail();
    }

    /**
     * 密码输入错误处理
     */
    public void passwordError(UserDetail userDetail, LoginAuthContext context) {
        AuthLoginType authLoginType = context.getAuthLoginType();
        int errCount = 0;
        // 密码错误限制
        if (authLoginType.getPwdErrNum() > -1) {

        }
        // String errMsg = StrUtil.format("密码不正确, 还有{}次机会",errCount);
        String errMsg = StrUtil.format("密码不正确");
        throw new LoginFailureException(userDetail.getUsername(), errMsg);
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

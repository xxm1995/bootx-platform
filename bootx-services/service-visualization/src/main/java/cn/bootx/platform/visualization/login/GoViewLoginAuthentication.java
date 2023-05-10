package cn.bootx.platform.visualization.login;

import cn.bootx.platform.baseapi.core.captcha.service.CaptchaService;
import cn.bootx.platform.iam.core.auth.login.PasswordLoginHandler;
import cn.bootx.platform.iam.core.user.service.UserAdminService;
import cn.bootx.platform.iam.core.user.service.UserQueryService;
import cn.bootx.platform.starter.auth.code.AuthLoginTypeCode;
import cn.bootx.platform.starter.auth.entity.LoginAuthContext;
import cn.bootx.platform.starter.auth.util.PasswordEncoder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @author xxm
 * @date 2023/2/16
 */
@Slf4j
@Component
public class GoViewLoginAuthentication extends PasswordLoginHandler {

    public GoViewLoginAuthentication(PasswordEncoder passwordEncoder, UserAdminService userAdminService,
            UserQueryService userQueryService, CaptchaService captchaService) {
        super(passwordEncoder, userAdminService, userQueryService, captchaService);
    }

    /**
     * 获取终端编码
     */
    @Override
    public String getLoginType() {
        return AuthLoginTypeCode.PASSWORD_GO_VIEW;
    }

    @Override
    public void authenticationBefore(LoginAuthContext context) {
        // 去除验证码的校验
    }

}

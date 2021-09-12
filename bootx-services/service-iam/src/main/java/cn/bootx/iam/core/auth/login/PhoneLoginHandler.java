package cn.bootx.iam.core.auth.login;

import cn.bootx.baseapi.core.captcha.service.CaptchaService;
import cn.bootx.iam.code.OpenIdLoginType;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.starter.auth.authentication.OpenIdAuthentication;
import cn.bootx.starter.auth.entity.AuthClient;
import cn.bootx.starter.auth.entity.AuthInfoResult;
import cn.bootx.starter.auth.exception.LoginFailureException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**   
* 手机号登录
* @author xxm  
* @date 2021/8/2 
*/
@Slf4j
@Component
@RequiredArgsConstructor
public class PhoneLoginHandler implements OpenIdAuthentication {
    private final String phoneParameter = "phone";
    // 短信验证码
    private final String captchaParameter = "smsCaptcha";

    private final UserInfoManager userInfoManager;
    private final CaptchaService captchaService;

    @Override
    public String getOpenIdType() {
        return OpenIdLoginType.PHONE;
    }

    /**
     * 认证
     */
    @Override
    public AuthInfoResult attemptAuthentication(HttpServletRequest request, HttpServletResponse response, AuthClient authClient) {
        String phone = request.getParameter(phoneParameter);
        String captcha = request.getParameter(captchaParameter);

        // 比较验证码是否正确
        if (!captchaService.validateSmsCaptcha(phone,captcha)){
            throw new LoginFailureException(phone,"短信验证码不正确");
        }
        // 获取用户信息
        UserInfo userInfo = userInfoManager.findByPhone(phone)
                .orElseThrow(() -> new LoginFailureException(phone,"手机号不存在"));

        captchaService.deleteSmsCaptcha(phone);
        return new AuthInfoResult()
                .setUserDetail(userInfo.toUserDetail())
                .setId(userInfo.getId());
    }

}

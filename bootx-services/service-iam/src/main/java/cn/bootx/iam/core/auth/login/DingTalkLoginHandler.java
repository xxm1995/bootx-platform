package cn.bootx.iam.core.auth.login;

import cn.bootx.iam.core.social.entity.UserSocialLogin;
import cn.bootx.iam.core.social.service.UserSocialQueryService;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.starter.auth.authentication.OpenIdAuthentication;
import cn.bootx.starter.auth.entity.AuthClient;
import cn.bootx.starter.auth.entity.AuthInfoResult;
import cn.bootx.starter.auth.exception.LoginFailureException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static cn.bootx.iam.code.OpenIdLoginType.DING_TALK;

/**   
* 钉钉登录
* @author xxm  
* @date 2022/4/2 
*/
@Component
@RequiredArgsConstructor
public class DingTalkLoginHandler implements OpenIdAuthentication {
    // 手机号
    private final String DING_OPEN_ID = "dingOpenId";

    private final UserSocialQueryService userSocialQueryService;
    private final UserInfoManager userInfoManager;

    /**
     * 钉钉登录
     */
    @Override
    public String getOpenIdType() {
        return DING_TALK;
    }

    /**
     * 尝试认证, 获取用户
     */
    @Override
    public AuthInfoResult attemptAuthentication(HttpServletRequest request, HttpServletResponse response, AuthClient authClient) {
        String dingOpenId = request.getParameter(DING_OPEN_ID);
        // 获取钉钉关联的用户id
        UserSocialLogin userSocialLogin = userSocialQueryService.findByOpenid(dingOpenId, UserSocialLogin::getDingTalkId)
                .orElseThrow(() -> new LoginFailureException("未找到对应用户"));

        // 获取用户信息
        UserInfo userInfo = userInfoManager.findById(userSocialLogin.getUserId())
                .orElseThrow(() -> new LoginFailureException("用户不存在"));

        return new AuthInfoResult()
                .setUserDetail(userInfo.toUserDetail())
                .setId(userInfo.getId());
    }

}

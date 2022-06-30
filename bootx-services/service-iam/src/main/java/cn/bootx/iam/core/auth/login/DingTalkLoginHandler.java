package cn.bootx.iam.core.auth.login;

import cn.bootx.iam.core.social.entity.UserSocialLogin;
import cn.bootx.iam.core.social.service.UserSocialQueryService;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.starter.auth.authentication.OpenIdAuthentication;
import cn.bootx.starter.auth.configuration.AuthProperties;
import cn.bootx.starter.auth.entity.AuthInfoResult;
import cn.bootx.starter.auth.entity.LoginAuthContext;
import cn.bootx.starter.auth.exception.LoginFailureException;
import lombok.RequiredArgsConstructor;
import lombok.val;
import me.zhyd.oauth.config.AuthConfig;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.model.AuthResponse;
import me.zhyd.oauth.model.AuthUser;
import me.zhyd.oauth.request.AuthDingTalkRequest;
import me.zhyd.oauth.request.AuthRequest;
import me.zhyd.oauth.utils.AuthStateUtils;
import org.springframework.stereotype.Component;

import java.util.Objects;

import static cn.bootx.iam.code.OpenIdLoginType.*;

/**
 * 钉钉登录
 * @author xxm
 * @date 2022/4/2
 */
@Component
@RequiredArgsConstructor
public class DingTalkLoginHandler implements OpenIdAuthentication {
    // 授权码
    private final UserSocialQueryService userSocialQueryService;
    private final UserInfoManager userInfoManager;
    private final AuthProperties authProperties;

    /**
     * 钉钉登录
     */
    @Override
    public String getClientCode() {
        return DING_TALK;
    }

    /**
     * 尝试认证, 获取用户
     */
    @Override
    public AuthInfoResult attemptAuthentication(LoginAuthContext context) {
        String authCode = context.getRequest().getParameter(AUTH_CODE);
        String state = context.getRequest().getParameter(STATE);

        AuthUser authUser = this.getAuthUser(authCode, state);
        // 获取钉钉关联的用户id
        UserSocialLogin userSocialLogin = userSocialQueryService.findByOpenid(authUser.getUuid(), UserSocialLogin::getDingTalkId)
                .orElseThrow(() -> new LoginFailureException("钉钉没有找到绑定的用户"));

        // 获取用户信息
        UserInfo userInfo = userInfoManager.findById(userSocialLogin.getUserId())
                .orElseThrow(() -> new LoginFailureException("用户不存在"));

        return new AuthInfoResult()
                .setUserDetail(userInfo.toUserDetail())
                .setId(userInfo.getId());
    }

    /**
     * 获取登录地址
     */
    @Override
    public String getLoginUrl(){
        AuthRequest authRequest = this.getAuthRequest();
        return authRequest.authorize(AuthStateUtils.createState());
    }

    /**
     * 获取关联的的第三方平台用户信息
     */
    @Override
    @SuppressWarnings("unchecked")
    public AuthUser getAuthUser(String authCode, String state){
        AuthRequest authRequest = this.getAuthRequest();
        AuthCallback callback = AuthCallback.builder()
                .code(authCode)
                .state(state)
                .build();
        AuthResponse<AuthUser> response = authRequest.login(callback);
        return response.getData();
    }

    /**
     * 获取钉钉认证请求
     */
    private AuthDingTalkRequest getAuthRequest(){
        val thirdLogin = authProperties.getThirdLogin().getDingTalk();
        if (Objects.isNull(thirdLogin)){
            throw new LoginFailureException("钉钉开放登录配置有误");
        }
        return new AuthDingTalkRequest(AuthConfig.builder()
                .clientId(thirdLogin.getClientId())
                .clientSecret(thirdLogin.getClientSecret())
                .redirectUri(thirdLogin.getRedirectUri())
                .build());
    }
}

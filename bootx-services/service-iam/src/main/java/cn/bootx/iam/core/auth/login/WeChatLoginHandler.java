package cn.bootx.iam.core.auth.login;

import cn.bootx.iam.code.OpenIdLoginType;
import cn.bootx.iam.core.third.dao.UserThirdManager;
import cn.bootx.iam.core.third.entity.UserThird;
import cn.bootx.iam.core.third.service.UserTiredOperateService;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.starter.auth.authentication.OpenIdAuthentication;
import cn.bootx.starter.auth.configuration.AuthProperties;
import cn.bootx.starter.auth.entity.AuthInfoResult;
import cn.bootx.starter.auth.entity.LoginAuthContext;
import cn.bootx.starter.auth.exception.LoginFailureException;
import cn.bootx.starter.auth.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import me.zhyd.oauth.config.AuthConfig;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.model.AuthResponse;
import me.zhyd.oauth.model.AuthUser;
import me.zhyd.oauth.request.AuthRequest;
import me.zhyd.oauth.request.AuthWeChatOpenRequest;
import me.zhyd.oauth.utils.AuthStateUtils;
import org.springframework.stereotype.Component;

import java.util.Objects;

import static cn.bootx.iam.code.OpenIdLoginType.*;

/**
* 微信登录
* @author xxm
* @date 2021/8/2
*/
@Slf4j
@Component
@RequiredArgsConstructor
public class WeChatLoginHandler implements OpenIdAuthentication {
    private final UserTiredOperateService userTiredOperateService;

    private final UserThirdManager userThirdManager;
    private final UserInfoManager userInfoManager;
    private final AuthProperties authProperties;

    @Override
    public String getLoginType() {
        return OpenIdLoginType.WE_CHAT;
    }

    /**
     * 认证
     */
    @Override
    public AuthInfoResult attemptAuthentication(LoginAuthContext context) {
        String authCode = context.getRequest().getParameter(AUTH_CODE);
        String state = context.getRequest().getParameter(STATE);

        AuthUser authUser = this.getAuthUser(authCode, state);

        // 获取企微关联的用户id
        UserThird userThird = userThirdManager.findByField(UserThird::getWeChatId,authUser.getUuid())
                .orElseThrow(() -> new LoginFailureException("微信没有找到绑定的用户"));

        // 获取用户信息
        UserInfo userInfo = userInfoManager.findById(userThird.getUserId())
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
        if (!Objects.equals(response.getCode(),OpenIdLoginType.SUCCESS)){
            log.error("微信登录报错: {}",response.getMsg());
            throw new LoginFailureException("微信登录出错");
        }
        return response.getData();
    }

    /**
     * 绑定用户
     */
    @Override
    public void bindUser(String authCode, String state){
        Long userId = SecurityUtil.getUserId();
        AuthUser authUser = this.getAuthUser(authCode, state);
        userTiredOperateService.existsByOpenId(authUser.getUuid(), UserThird::getWeChatId);
        userTiredOperateService.bindOpenId(userId,authUser.getUuid(), UserThird::setWeChatId);
        userTiredOperateService.bindOpenInfo(userId,authUser,WE_CHAT);
    }

    /**
     * 获取企业微信认证请求
     */
    private AuthWeChatOpenRequest getAuthRequest(){
        val thirdLogin = authProperties.getThirdLogin().getWeCom();
        if (Objects.isNull(thirdLogin)){
            throw new LoginFailureException("钉钉开放登录配置有误");
        }
        return new AuthWeChatOpenRequest(AuthConfig.builder()
                .clientId(thirdLogin.getClientId())
                .clientSecret(thirdLogin.getClientSecret())
                .redirectUri(thirdLogin.getRedirectUri())
                .build());
    }
}

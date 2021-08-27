package cn.bootx.starter.auth.service;

import cn.bootx.common.core.code.CommonCode;
import cn.bootx.starter.auth.authentication.GetAuthClientService;
import cn.bootx.starter.auth.authentication.UsernamePasswordAuthentication;
import cn.bootx.starter.auth.entity.AuthClient;
import cn.bootx.starter.auth.entity.AuthInfoResult;
import cn.bootx.starter.auth.exception.LoginFailureException;
import cn.bootx.starter.auth.handler.LoginFailureHandler;
import cn.bootx.starter.auth.handler.LoginSuccessHandler;
import cn.bootx.starter.auth.handler.OpenIdAuthenticationHandler;
import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.StpUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**   
* 认证相关服务
* @author xxm  
* @date 2021/7/30 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class TokenService {

    private final GetAuthClientService getAuthClientService;
    private final UsernamePasswordAuthentication usernamePasswordAuthentication;

    private final OpenIdAuthenticationHandler openIdAuthenticationHandler;
    private final LoginSuccessHandler loginSuccessHandler;
    private final LoginFailureHandler loginFailureHandler;

    /**
     * 登录
     */
    public String loginPassword(HttpServletRequest request, HttpServletResponse response){
        AuthInfoResult authInfoResult;
        try {
            authInfoResult = usernamePasswordAuthentication.authentication(request, response);
            this.login(authInfoResult);
        } catch (LoginFailureException e) {
            // 登录失败回调
            loginFailureHandler.onLoginFailure(request,response,e);
            throw e;
        }
        // 登录成功回调
        loginSuccessHandler.onLoginSuccess(request,response,authInfoResult);
        return StpUtil.getTokenValue();
    }

    /**
     * 三方登录获取Token
     */
    public String loginOpenId(HttpServletRequest request, HttpServletResponse response){
        AuthInfoResult authInfoResult;
        try {
            authInfoResult = openIdAuthenticationHandler.authentication(request, response);
        this.login(authInfoResult);
        } catch (LoginFailureException e) {
            // 登录失败回调
            loginFailureHandler.onLoginFailure(request,response,e);
            throw e;
        }
        loginSuccessHandler.onLoginSuccess(request,response,authInfoResult);
        return StpUtil.getTokenValue();
    }

    /**
     * 登录
     */
    private void login(AuthInfoResult authInfoResult){
        // 终端处理
        AuthClient authClient = getAuthClientService.getAuthClient(authInfoResult.getClient());
        if (!authClient.isEnable()){
            throw new LoginFailureException(authInfoResult.getUserDetail().getUsername(),"该终端方式已禁用");
        }
        SaLoginModel saLoginModel = new SaLoginModel()
                .setDevice(authClient.getCode())
                .setTimeout(authClient.getTimeout() * 1000 * 60);

        StpUtil.login(authInfoResult.getId(),saLoginModel);
        SaSession session = StpUtil.getSession();
        session.set(CommonCode.USER, authInfoResult.getUserDetail());
    }

    /**
     * 退出
     */
    public void logout() {
        StpUtil.logout();
    }
}

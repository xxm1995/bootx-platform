package cn.bootx.starter.auth.endpoint;

import cn.bootx.common.core.code.CommonCode;
import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.util.CollUtil;
import cn.bootx.starter.auth.authentication.GetAuthClientService;
import cn.bootx.starter.auth.authentication.GetAuthLoginTypeService;
import cn.bootx.starter.auth.authentication.UsernamePasswordAuthentication;
import cn.bootx.starter.auth.configuration.AuthProperties;
import cn.bootx.starter.auth.entity.AuthClient;
import cn.bootx.starter.auth.entity.AuthLoginType;
import cn.bootx.starter.auth.entity.AuthInfoResult;
import cn.bootx.starter.auth.entity.LoginAuthContext;
import cn.bootx.starter.auth.exception.ClientNotEnableException;
import cn.bootx.starter.auth.exception.LoginFailureException;
import cn.bootx.starter.auth.handler.LoginFailureHandler;
import cn.bootx.starter.auth.handler.LoginSuccessHandler;
import cn.bootx.starter.auth.handler.OpenIdAuthenticationHandler;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.StpUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**   
* 认证相关服务
* @author xxm  
* @date 2021/7/30 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class TokenService {

    private final GetAuthLoginTypeService getAuthLoginTypeService;
    private final GetAuthClientService getAuthClientService;
    private final UsernamePasswordAuthentication usernamePasswordAuthentication;

    private final AuthProperties authProperties;

    private final OpenIdAuthenticationHandler openIdAuthenticationHandler;
    private final List<LoginSuccessHandler> loginSuccessHandlers;
    private final List<LoginFailureHandler> loginFailureHandlers;

    /**
     * 账号密码登录
     */
    public String loginPassword(HttpServletRequest request, HttpServletResponse response){

        AuthInfoResult authInfoResult;
        AuthLoginType authLoginType = this.getAuthLoginType(request);
        AuthClient authClient = this.getAuthApplication(request);
        try {
            LoginAuthContext loginAuthContext = new LoginAuthContext()
                    .setRequest(request)
                    .setResponse(response)
                    .setAuthProperties(authProperties)
                    .setAuthLoginType(authLoginType)
                    .setAuthClient(authClient);
            // 校验登录终端
            this.validateAuthClient(loginAuthContext);
            authInfoResult = usernamePasswordAuthentication.authentication(loginAuthContext);
            this.login(authInfoResult,loginAuthContext);
        } catch (LoginFailureException e) {
            // 登录失败回调
            this.loginFailureHandler(request,response,e);
            throw e;
        }
        // 登录成功回调
        this.loginSuccessHandler(request,response,authInfoResult);
        return StpUtil.getTokenValue();
    }

    /**
     * 三方登录获取Token
     */
    public String loginOpenId(HttpServletRequest request, HttpServletResponse response){
        AuthInfoResult authInfoResult;
        AuthLoginType authLoginType = this.getAuthLoginType(request);
        AuthClient authClient = this.getAuthApplication(request);
        try {
            LoginAuthContext loginAuthContext = new LoginAuthContext()
                    .setRequest(request)
                    .setResponse(response)
                    .setAuthProperties(authProperties)
                    .setAuthLoginType(authLoginType)
                    .setAuthClient(authClient);
            // 校验登录终端
            this.validateAuthClient(loginAuthContext);
            authInfoResult = openIdAuthenticationHandler.authentication(loginAuthContext);
        this.login(authInfoResult,loginAuthContext);
        } catch (LoginFailureException e) {
            // 登录失败回调
            this.loginFailureHandler(request,response,e);
            throw e;
        }
        this.loginSuccessHandler(request,response,authInfoResult);
        return StpUtil.getTokenValue();
    }

    /**
     * 成功处理
     */
    private void loginSuccessHandler(HttpServletRequest request, HttpServletResponse response,AuthInfoResult authInfoResult){
        for (LoginSuccessHandler loginSuccessHandler : loginSuccessHandlers) {
            try {
                loginSuccessHandler.onLoginSuccess(request,response,authInfoResult);
            } catch (Exception ignored) {
            }
        }
    }

    /**
     * 失败处理
     */
    private void loginFailureHandler(HttpServletRequest request, HttpServletResponse response,LoginFailureException e){
        for (LoginFailureHandler loginFailureHandler : loginFailureHandlers) {
            try {
                loginFailureHandler.onLoginFailure(request,response,e);
            } catch (Exception ignored) {
            }
        }
    }

    /**
     * 获取终端
     */
    private AuthLoginType getAuthLoginType(HttpServletRequest request){
        // 终端
        AuthLoginType authLoginType = getAuthLoginTypeService.getAuthLoginType(SecurityUtil.getLoginType(request));
        if (!authLoginType.isEnable()){
            throw new ClientNotEnableException();
        }
        return authLoginType;
    }

    /**
     * 获取应用
     */
    private AuthClient getAuthApplication(HttpServletRequest request){
        // 应用
        AuthClient authClient = getAuthClientService.getAuthApplication(SecurityUtil.getClient(request));
        if (!authClient.isEnable()){
            throw new ClientNotEnableException();
        }
        return authClient;
    }

    /**
     * 校验该认证应用是否支持此种登录方式
     */
    private void validateAuthClient(LoginAuthContext loginAuthContext){
        AuthClient authClient = loginAuthContext.getAuthClient();
        AuthLoginType authLoginType = loginAuthContext.getAuthLoginType();
        if (CollUtil.isEmpty(authClient.getLoginTypeIds()) || !authClient.getLoginTypeIds().contains(authLoginType.getId())){
            throw new LoginFailureException("不支持的登录方式");
        }
    }

    /**
     * 登录
     */
    private void login(AuthInfoResult authInfoResult,LoginAuthContext context){
        AuthLoginType authLoginType = context.getAuthLoginType();
        AuthClient authClient = context.getAuthClient();
        SaLoginModel saLoginModel = new SaLoginModel()
                .setDevice(authClient.getCode())
                .setTimeout(authLoginType.getTimeout() * 1000 * 60);

        authInfoResult.setClient(authClient.getCode())
                .setLoginType(authLoginType.getCode());
        StpUtil.login(authInfoResult.getId(),saLoginModel);
        SaSession session = StpUtil.getSession();
        UserDetail userDetail = authInfoResult.getUserDetail();
        session.set(CommonCode.USER, userDetail);
    }

    /**
     * 退出
     */
    public void logout() {
        StpUtil.logout();
    }
}

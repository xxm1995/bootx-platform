package cn.bootx.starter.auth.authentication;

import cn.bootx.starter.auth.entity.AuthInfoResult;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotNull;

/**
 * 抽象认证器
 * @author xxm
 * @date 2021/7/30
 */
public interface AbstractAuthentication {

    /**
     * 认证前操作
     */
    default void authenticationBefore(HttpServletRequest request, HttpServletResponse response) {

    }

    /**
     * 尝试认证, 必须重写
     */
    @NotNull AuthInfoResult attemptAuthentication(HttpServletRequest request, HttpServletResponse response);

    /**
     * 认证后处理
     */
    default void authenticationAfter(AuthInfoResult authInfoResult,HttpServletRequest request, HttpServletResponse response){

    }

    /**
     * 认证流程
     */
    default AuthInfoResult authentication(HttpServletRequest request, HttpServletResponse response){
        this.authenticationBefore(request,response);
        AuthInfoResult authInfoResult = this.attemptAuthentication(request, response);
        authenticationAfter(authInfoResult,request,response);
        return authInfoResult;
    }

}

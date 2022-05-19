package cn.bootx.starter.auth.authentication;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.starter.auth.config.AuthProperties;
import cn.bootx.starter.auth.entity.AuthClient;
import cn.bootx.starter.auth.entity.AuthInfoResult;
import cn.bootx.starter.auth.entity.LoginAuthContext;
import cn.bootx.starter.auth.exception.LoginFailureException;

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
    default void authenticationBefore(LoginAuthContext context) {

    }

    /**
     * 尝试认证, 必须重写
     */
    @NotNull AuthInfoResult attemptAuthentication(LoginAuthContext context);

    /**
     * 认证后处理
     */
    default void authenticationAfter(AuthInfoResult authInfoResult,LoginAuthContext context){

    }

    /**
     * 认证流程
     */
    default AuthInfoResult authentication(LoginAuthContext context){
        this.authenticationBefore(context);
        // 认证逻辑
        AuthInfoResult authInfoResult = this.attemptAuthentication(context);
        AuthClient authClient = context.getAuthClient();
        // 添加用户信息到上下文中
        UserDetail userDetail = authInfoResult.getUserDetail();
        context.setUserDetail(userDetail);

        // 判断是否开启了超级管理员
        AuthProperties authProperties = context.getAuthProperties();
        if (!authProperties.isEnableAdmin()&&userDetail.isAdmin()){
            throw new LoginFailureException("未开启超级管理员权限");
        }
        // 管理员跳过各种限制
        if (!userDetail.isAdmin()){
            // 在终端有独立权限控制的情况下, 判断用户是否拥有终端的权限
            if (authClient.isAlonePrem() && !userDetail.getClientIds().contains(authClient.getId())){
                throw new LoginFailureException("该用户不拥有该终端的权限");
            }
        }
        authenticationAfter(authInfoResult,context);
        return authInfoResult;
    }

}

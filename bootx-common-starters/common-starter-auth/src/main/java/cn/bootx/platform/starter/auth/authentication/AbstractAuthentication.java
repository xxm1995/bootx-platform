package cn.bootx.platform.starter.auth.authentication;

import cn.bootx.platform.common.core.entity.UserDetail;
import cn.bootx.platform.starter.auth.configuration.AuthProperties;
import cn.bootx.platform.starter.auth.entity.AuthClient;
import cn.bootx.platform.starter.auth.entity.AuthInfoResult;
import cn.bootx.platform.starter.auth.entity.LoginAuthContext;
import cn.bootx.platform.starter.auth.exception.LoginFailureException;
import cn.hutool.extra.spring.SpringUtil;

import javax.validation.constraints.NotNull;
import java.util.Objects;

/**
 * 抽象认证器
 *
 * @author xxm
 * @since 2021/7/30
 */
public interface AbstractAuthentication {

    /**
     * 获取终端编码
     */
    String getLoginType();
    /**
     * 获取终端编码
     */
    default UserInfoStatusCheck getUserInfoStatusCheck() {
        return SpringUtil.getBean(UserInfoStatusCheck.class);
    }

    /**
     * 登录类型是否匹配
     */
    default boolean adaptation(String loginType) {
        return Objects.equals(getLoginType(), loginType);
    }

    /**
     * 认证前操作
     */
    default void authenticationBefore(LoginAuthContext context) {

    }

    /**
     * 尝试认证, 必须重写
     */
    @NotNull
    AuthInfoResult attemptAuthentication(LoginAuthContext context);

    /**
     * 对用户信息状态进行校验
     */
    default void userInfoStatusCheck(AuthInfoResult authInfoResult, LoginAuthContext context){
//        getUserInfoStatusCheck().check(authInfoResult, context);
    }

    /**
     * 认证后处理
     */
    default void authenticationAfter(AuthInfoResult authInfoResult, LoginAuthContext context) {

    }

    /**
     * 认证流程
     */
    default AuthInfoResult authentication(LoginAuthContext context) {
        this.authenticationBefore(context);
        // 认证逻辑
        AuthInfoResult authInfoResult = this.attemptAuthentication(context);
        AuthClient authClient = context.getAuthClient();
        // 添加用户信息到上下文中
        UserDetail userDetail = authInfoResult.getUserDetail();
        context.setUserDetail(userDetail);
        // 判断是否开启了超级管理员
        AuthProperties authProperties = context.getAuthProperties();
        if (!authProperties.isEnableAdmin() && userDetail.isAdmin()) {
            throw new LoginFailureException("未开启超级管理员权限");
        }
        // 管理员跳过各种限制
        if (!userDetail.isAdmin()) {
            // 判断用户是否拥有认证应用的权限
            if (!userDetail.getAppIds().contains(authClient.getId())) {
                throw new LoginFailureException("该用户不拥有该终端的权限");
            }
            // 用户信息和状态检查
            this.userInfoStatusCheck(authInfoResult, context);
        }
        authenticationAfter(authInfoResult, context);
        return authInfoResult;
    }

}

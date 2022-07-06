package cn.bootx.starter.auth.authentication;

import cn.bootx.starter.auth.entity.ThirdAuthCode;
import me.zhyd.oauth.model.AuthCallback;
import me.zhyd.oauth.model.AuthUser;

import java.util.Objects;

/**
* openId登录认证器
* @author xxm  
* @date 2021/7/30 
*/
public interface OpenIdAuthentication extends AbstractAuthentication{

    /**
     * 获取终端编码
     */
    String getLoginType();

    /**
     * 获取登录地址
     */
    default String getLoginUrl() {
        return "";
    }

    /**
     * 获取认证授权码
     */
    default ThirdAuthCode getAuthCode(AuthCallback callback){
        return new ThirdAuthCode()
                .setCode(callback.getCode())
                .setState(callback.getState());
    }

    /**
     * openId类型是否匹配
     */
    default boolean adaptation(String loginType){
        return Objects.equals(getLoginType(),loginType);
    }

    /**
     * 获取关联的的第三方平台用户信息
     */
    default AuthUser getAuthUser(String authCode, String state){
        return null;
    };
}

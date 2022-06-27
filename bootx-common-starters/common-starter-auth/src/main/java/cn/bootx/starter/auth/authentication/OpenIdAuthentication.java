package cn.bootx.starter.auth.authentication;

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
    String getClientCode();

    /**
     * openId类型是否匹配
     */
    default boolean adaptation(String clientCode){
        return Objects.equals(getClientCode(),clientCode);
    }

}

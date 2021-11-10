package cn.bootx.starter.auth.authentication;

import java.util.Objects;

/**
* openId登录认证器
* @author xxm  
* @date 2021/7/30 
*/
public interface OpenIdAuthentication extends AbstractAuthentication{
    
    /** openId类型 */
    String getOpenIdType();

    /** openId类型是否匹配 */
    default boolean adaptation(String openIdType){
        return Objects.equals(getOpenIdType(),openIdType);
    }

}

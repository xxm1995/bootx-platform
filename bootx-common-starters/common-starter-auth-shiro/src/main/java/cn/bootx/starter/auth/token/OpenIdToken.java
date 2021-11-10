package cn.bootx.starter.auth.token;

import org.apache.shiro.authc.AuthenticationToken;

/**   
* 开放ID方式登录
* @author xxm  
* @date 2021/11/10 
*/
public class OpenIdToken implements AuthenticationToken {
    @Override
    public Object getPrincipal() {
        return null;
    }

    @Override
    public Object getCredentials() {
        return null;
    }
}

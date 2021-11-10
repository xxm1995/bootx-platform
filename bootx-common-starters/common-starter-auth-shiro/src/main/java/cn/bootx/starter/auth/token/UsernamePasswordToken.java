package cn.bootx.starter.auth.token;


import org.apache.shiro.authc.AuthenticationToken;

/**   
* 用户名密码登陆方式
* @author xxm  
* @date 2021/11/10 
*/
public class UsernamePasswordToken implements AuthenticationToken {
    @Override
    public Object getPrincipal() {
        return null;
    }

    @Override
    public Object getCredentials() {
        return null;
    }
}

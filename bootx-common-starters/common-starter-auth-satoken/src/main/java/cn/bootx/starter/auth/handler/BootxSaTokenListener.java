package cn.bootx.starter.auth.handler;

import cn.dev33.satoken.listener.SaTokenListenerDefaultImpl;
import cn.dev33.satoken.stp.SaLoginModel;
import org.springframework.stereotype.Component;

/**   
* 自定义侦听器实现
* @author xxm  
* @date 2021/7/30 
*/
@Component
public class BootxSaTokenListener extends SaTokenListenerDefaultImpl {

    /** 每次登录时触发 */
    @Override
    public void doLogin(String loginType, Object loginId, SaLoginModel loginModel) {
        // ...

    }

    /** 每次注销时触发 */
    @Override
    public void doLogout(String loginType, Object loginId, String tokenValue) {
        // ...
    }

    /** 每次被踢下线时触发 */
    @Override
    public void doLogoutByLoginId(String loginType, Object loginId, String tokenValue, String device) {
        // ...
    }

    /** 每次被顶下线时触发 */
    @Override
    public void doReplaced(String loginType, Object loginId, String tokenValue, String device) {
        // ...
    }

    /** 每次被封禁时触发 */
    @Override
    public void doDisable(String loginType, Object loginId, long disableTime) {
        // ...
    }

    /** 每次被解封时触发 */
    @Override
    public void doUntieDisable(String loginType, Object loginId) {
        // ...
    }

    /** 每次创建Session时触发 */
    @Override
    public void doCreateSession(String id) {
        // ...
    }

    /** 每次注销Session时触发 */
    @Override
    public void doLogoutSession(String id) {
        // ...
    }
}

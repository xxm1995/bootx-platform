package cn.bootx.starter.auth.handler;

import cn.bootx.starter.auth.entity.AuthInfoResult;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**   
* 登录成功处理器
* @author xxm  
* @date 2021/8/13 
*/
public interface LoginSuccessHandler {
    void onLoginSuccess(HttpServletRequest request, HttpServletResponse response, AuthInfoResult authInfoResult);
}

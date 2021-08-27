package cn.bootx.iam.core.auth.login;

import cn.bootx.iam.code.OpenIdLoginType;
import cn.bootx.starter.auth.authentication.OpenIdAuthentication;
import cn.bootx.starter.auth.entity.AuthInfoResult;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
* 微信登录
* @author xxm
* @date 2021/8/2
*/
@Component
@RequiredArgsConstructor
public class WeChatLoginHandler implements OpenIdAuthentication {

    @Override
    public String getOpenIdType() {
        return OpenIdLoginType.WE_CHAT;
    }

    @Override
    public AuthInfoResult attemptAuthentication(HttpServletRequest request, HttpServletResponse response) {
        return null;
    }
}

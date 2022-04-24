package cn.bootx.starter.auth.handler;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.starter.auth.authentication.OpenIdAuthentication;
import cn.bootx.starter.auth.config.AuthProperties;
import cn.bootx.starter.auth.config.LoginAuthContext;
import cn.bootx.starter.auth.entity.AuthInfoResult;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
* OpenID登录处理器
* @author xxm  
* @date 2021/7/30 
*/
@Slf4j
@Component
@RequiredArgsConstructor
public class OpenIdAuthenticationHandler {
    private final List<OpenIdAuthentication> openIdAuthentications;
    private final AuthProperties authProperties;

    /**
     * 认证
     */
    public @NotNull AuthInfoResult authentication(LoginAuthContext context){
        String obtainOpenIdType = obtainOpenIdType(context.getRequest());
        for (OpenIdAuthentication openIdAuthentication : openIdAuthentications) {
            if (openIdAuthentication.adaptation(obtainOpenIdType)){
                return openIdAuthentication.authentication(context);
            }
        }
        throw new BizException("未找到对应的OpenId认证器");
    }


    @Nullable
    protected String obtainOpenIdType(HttpServletRequest request) {
        return request.getParameter(authProperties.getOpenIdTypeParameter());
    }

}

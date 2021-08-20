package cn.bootx.starter.auth.handler;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.starter.auth.authentication.OpenIdAuthentication;
import cn.bootx.starter.auth.config.AuthProperties;
import cn.bootx.starter.auth.entity.AuthInfoResult;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Objects;

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

    private String openIdTypeParameter;


    /**
     * 认证
     */
    public @NotNull AuthInfoResult authentication(HttpServletRequest request, HttpServletResponse response){
        String obtainOpenIdType = obtainOpenIdType(request);
        for (OpenIdAuthentication openIdAuthentication : openIdAuthentications) {
            if (openIdAuthentication.adaptation(obtainOpenIdType)){
                return openIdAuthentication.authentication(request,response);
            }
        }
        throw new BizException("未找到对应的OpenId认证器");
    }


    @Nullable
    protected String obtainOpenIdType(HttpServletRequest request) {
        if (Objects.nonNull(this.openIdTypeParameter)){
            return request.getParameter(this.openIdTypeParameter);
        }
        return request.getParameter(authProperties.getOpenIdTypeParameter());
    }

    public void setOpenIdTypeParameter(String openIdTypeParameter) {
        Assert.hasText(openIdTypeParameter, "验证码key参数不能为空或为空");
        this.openIdTypeParameter = openIdTypeParameter;
    }

}

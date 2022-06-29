package cn.bootx.iam.core.auth.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.starter.auth.authentication.OpenIdAuthentication;
import cn.bootx.starter.auth.entity.ThirdAuthCode;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.zhyd.oauth.model.AuthCallback;
import org.springframework.stereotype.Service;

import java.util.List;

/**   
* 三方登录
* @author xxm  
* @date 2022/6/29 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class ThirdLoginService {

    private final List<OpenIdAuthentication> openIdAuthentications;

    /**
     * 获取登录地址
     */
    public String getLoginUrl(String clientCode){
        OpenIdAuthentication openIdAuthentication = this.getOpenIdAuthentication(clientCode);
        return openIdAuthentication.getLoginUrl();
    }

    /**
     * 回调
     */
    public ThirdAuthCode getAuthCode(String clientCode, AuthCallback authCallback) {
        OpenIdAuthentication openIdAuthentication = this.getOpenIdAuthentication(clientCode);
        return openIdAuthentication.getAuthCode(authCallback);
    }

    /**
     * 获取
     */
    private OpenIdAuthentication getOpenIdAuthentication(String clientCode){
        for (OpenIdAuthentication openIdAuthentication : openIdAuthentications) {
            if (openIdAuthentication.adaptation(clientCode)){
                return openIdAuthentication;
            }
        }
        throw new BizException("未找到对应的OpenId认证器");
    }
}

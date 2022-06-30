package cn.bootx.iam.core.auth.login;

import cn.bootx.iam.core.social.service.UserSocialQueryService;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.starter.auth.authentication.OpenIdAuthentication;
import cn.bootx.starter.auth.entity.AuthInfoResult;
import cn.bootx.starter.auth.entity.LoginAuthContext;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import static cn.bootx.iam.code.OpenIdLoginType.WE_COM;

/**   
* 企业微信登录
* @author xxm  
* @date 2022/6/30 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class WeComLoginHandler implements OpenIdAuthentication {
    private final UserSocialQueryService userSocialQueryService;
    private final UserInfoManager userInfoManager;

    @Override
    public String getClientCode() {
        return WE_COM;
    }

    @Override
    public AuthInfoResult attemptAuthentication(LoginAuthContext context) {
        return null;
    }
}

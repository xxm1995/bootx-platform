package cn.bootx.iam.core.social.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.iam.core.social.dao.UserSocialLoginManager;
import cn.bootx.iam.core.social.entity.UserSocialLogin;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.exception.user.UserInfoNotExistsException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;
import java.util.function.BiConsumer;


/**
 * 三方账号绑定
 * @author xxm
 * @date 2021/8/2
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class UserSocialBindService {
    private final UserSocialLoginManager userSocialLoginManager;
    private final UserInfoManager userInfoManager;

    /**
     * 绑定微信
     */
    public void bindWeChat(Long userId,String openId){
        this.bindOpenId(userId,openId,UserSocialLogin::setWeChatId);
    }

    /**
     * 绑定QQ
     */
    public void bindQq(Long userId,String openId){
        this.bindOpenId(userId,openId,UserSocialLogin::setQqId);
    }

    /**
     * 绑定钉钉
     */
    public void bindDingTalk(Long userId,String openId){
        this.bindOpenId(userId,openId,UserSocialLogin::setDingTalkId);
    }

    /**
     * 绑定
     */
    private void bindOpenId(Long userId,String openId,BiConsumer<UserSocialLogin, String> function){
        UserSocialLogin userSocialLogin = userSocialLoginManager.findByUserId(userId)
                .orElseThrow(DataNotExistException::new);
        if (Objects.isNull(userSocialLogin)){
            UserInfo userInfo = userInfoManager.findById(userId)
                    .orElseThrow(UserInfoNotExistsException::new);
            userSocialLogin = new UserSocialLogin();
            userSocialLogin.setUserId(userInfo.getId());
            function.accept(userSocialLogin,openId);
            userSocialLoginManager.save(userSocialLogin);
        } else {
            function.accept(userSocialLogin,openId);
            userSocialLoginManager.updateById(userSocialLogin);
        }
    }
}

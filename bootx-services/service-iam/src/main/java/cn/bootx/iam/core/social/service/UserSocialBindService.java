package cn.bootx.iam.core.social.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.iam.code.OpenIdLoginType;
import cn.bootx.iam.core.social.dao.UserSocialInfoManager;
import cn.bootx.iam.core.social.dao.UserSocialManager;
import cn.bootx.iam.core.social.entity.UserSocial;
import cn.bootx.iam.core.social.entity.UserSocialInfo;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.exception.user.UserInfoNotExistsException;
import cn.bootx.starter.auth.authentication.OpenIdAuthentication;
import cn.bootx.starter.auth.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.zhyd.oauth.model.AuthUser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;
import java.util.function.BiConsumer;

import static cn.bootx.iam.code.OpenIdLoginType.*;


/**
 * 三方账号绑定
 * @author xxm
 * @date 2021/8/2
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class UserSocialBindService {
    private final UserSocialManager userSocialManager;
    private final UserSocialInfoManager userSocialInfoManager;
    private final UserInfoManager userInfoManager;
    private final List<OpenIdAuthentication> openIdAuthentications;

    /**
     * 绑定账号
     */
    @Transactional(rollbackFor = Exception.class)
    public void bind(String authCode, String clientCode, String state){
        Long userId = SecurityUtil.getUserId();
        OpenIdAuthentication openIdAuthentication = this.getOpenIdAuthentication(clientCode);
        AuthUser authUser = openIdAuthentication.getAuthUser(authCode, state);
        switch (clientCode){
            case WE_CHAT:{
                this.bindWeChat(userId,authUser);
                break;
            }
            case OpenIdLoginType.WE_COM:{
                this.bindWeCom(userId,authUser);
                break;
            }
            case OpenIdLoginType.DING_TALK:{
                this.bindDingTalk(userId,authUser);
                break;
            }
            default:{
                throw new BizException("未被支持的三方登录方式");
            }
        }
    }


    /**
     * 绑定微信
     */
    private void bindWeChat(Long userId, AuthUser authUser){
        this.bindOpenId(userId,authUser.getUuid(),UserSocial::setWeChatId);
        this.bindOpenInfo(userId,authUser,WE_CHAT);
    }

    /**
     * 绑定企业微信
     */
    private void bindWeCom(Long userId, AuthUser authUser){
        this.bindOpenId(userId,authUser.getUuid(),UserSocial::setWeComId);
        this.bindOpenInfo(userId,authUser,WE_COM);
    }

    /**
     * 绑定钉钉
     */
    private void bindDingTalk(Long userId,AuthUser authUser){
        this.bindOpenId(userId,authUser.getUuid(),UserSocial::setDingTalkId);
        this.bindOpenInfo(userId,authUser,DING_TALK);
    }

    /**
     * 绑定 开放平台id
     */
    private void bindOpenId(Long userId,String openId,BiConsumer<UserSocial, String> function){
        UserSocial userSocial = userSocialManager.findByUserId(userId)
                .orElseThrow(DataNotExistException::new);
        if (Objects.isNull(userSocial)){
            UserInfo userInfo = userInfoManager.findById(userId)
                    .orElseThrow(UserInfoNotExistsException::new);
            userSocial = new UserSocial();
            userSocial.setUserId(userInfo.getId());
            function.accept(userSocial,openId);
            userSocialManager.save(userSocial);
        } else {
            function.accept(userSocial,openId);
            userSocialManager.updateById(userSocial);
        }
    }

    /**
     * 绑定开放平台信息
     */
    private void bindOpenInfo(Long userId, AuthUser authUser, String clientCode){
        // 详细信息 存在就删除重新添加
        userSocialInfoManager.deleteByUserAndClientCode(userId, clientCode);
        UserSocialInfo userSocialInfo = new UserSocialInfo()
                .setUserId(userId)
                .setClientCode(clientCode)
                .setUsername(authUser.getUsername())
                .setNickname(authUser.getNickname())
                .setAvatar(authUser.getAvatar());
        userSocialInfoManager.save(userSocialInfo);
    }

    /**
     * 获取 openId登录认证器
     */
    private OpenIdAuthentication getOpenIdAuthentication(String clientCode){
        for (OpenIdAuthentication openIdAuthentication : openIdAuthentications) {
            if (openIdAuthentication.adaptation(clientCode)){
                return openIdAuthentication;
            }
        }
        throw new BizException("未找到对应的终端认证器");
    }

    /**
     * 解除绑定
     */
    @Transactional
    public void unbind(String clientCode) {
        Long userId = SecurityUtil.getUserId();
        UserSocial userSocial = userSocialManager.findByUserId(userId)
                .orElseThrow(DataNotExistException::new);
        userSocialInfoManager.deleteByUserAndClientCode(userId, clientCode);
        switch (clientCode) {
            case WE_CHAT: {
                userSocialManager.unbind(userId,UserSocial::getWeChatId);
                break;
            }
            case OpenIdLoginType.WE_COM: {
                userSocialManager.unbind(userId,UserSocial::getWeComId);
                break;
            }
            case OpenIdLoginType.DING_TALK: {
                userSocialManager.unbind(userId,UserSocial::getDingTalkId);
                break;
            }
            default: {
                throw new BizException("未被支持的三方登录方式");
            }
        }
    }
}

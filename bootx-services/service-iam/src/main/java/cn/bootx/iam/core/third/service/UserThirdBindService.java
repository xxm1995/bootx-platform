package cn.bootx.iam.core.third.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.iam.code.OpenIdLoginType;
import cn.bootx.iam.core.third.dao.UserThirdInfoManager;
import cn.bootx.iam.core.third.dao.UserThirdManager;
import cn.bootx.iam.core.third.entity.UserThird;
import cn.bootx.iam.core.third.entity.UserThirdInfo;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.exception.user.UserInfoNotExistsException;
import cn.bootx.starter.auth.authentication.OpenIdAuthentication;
import cn.bootx.starter.auth.util.SecurityUtil;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
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
public class UserThirdBindService {
    private final UserThirdManager userThirdManager;
    private final UserThirdInfoManager userThirdInfoManager;
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
        this.existsByOpenId(authUser.getUuid(), UserThird::getWeChatId);
        this.bindOpenId(userId,authUser.getUuid(), UserThird::setWeChatId);
        this.bindOpenInfo(userId,authUser,WE_CHAT);
    }

    /**
     * 绑定企业微信
     */
    private void bindWeCom(Long userId, AuthUser authUser){
        this.existsByOpenId(authUser.getUuid(), UserThird::getWeComId);
        this.bindOpenId(userId,authUser.getUuid(), UserThird::setWeComId);
        this.bindOpenInfo(userId,authUser,WE_COM);
    }

    /**
     * 绑定钉钉
     */
    private void bindDingTalk(Long userId,AuthUser authUser){
        this.existsByOpenId(authUser.getUuid(), UserThird::getDingTalkId);
        this.bindOpenId(userId,authUser.getUuid(), UserThird::setDingTalkId);
        this.bindOpenInfo(userId,authUser,DING_TALK);
    }

    /**
     * 判断该OpenId是否已经被使用
     */
    private void existsByOpenId(String openId, SFunction<UserThird, String> field){
        if (userThirdManager.existedByField(field,openId)){
            throw new BizException("该第三方平台已经被绑定");
        }
    }

    /**
     * 绑定 开放平台id
     */
    private void bindOpenId(Long userId,String openId,BiConsumer<UserThird, String> function){
        // 没有新增, 存在则更新
        UserThird userThird = userThirdManager.findByUserId(userId).orElse(null);
        if (Objects.isNull(userThird)){
            UserInfo userInfo = userInfoManager.findById(userId)
                    .orElseThrow(UserInfoNotExistsException::new);
            userThird = new UserThird();
            userThird.setUserId(userInfo.getId());
            function.accept(userThird,openId);
            userThirdManager.save(userThird);
        } else {
            function.accept(userThird,openId);
            userThirdManager.updateById(userThird);
        }
    }

    /**
     * 绑定开放平台信息
     */
    private void bindOpenInfo(Long userId, AuthUser authUser, String clientCode){
        // 详细信息 存在就删除重新添加
        userThirdInfoManager.deleteByUserAndClientCode(userId, clientCode);
        UserThirdInfo userThirdInfo = new UserThirdInfo()
                .setUserId(userId)
                .setClientCode(clientCode)
                .setUsername(authUser.getUsername())
                .setNickname(authUser.getNickname())
                .setAvatar(authUser.getAvatar());
        userThirdInfoManager.save(userThirdInfo);
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
        UserThird userThird = userThirdManager.findByUserId(userId)
                .orElseThrow(DataNotExistException::new);
        userThirdInfoManager.deleteByUserAndClientCode(userId, clientCode);
        switch (clientCode) {
            case WE_CHAT: {
                userThirdManager.unbind(userId, UserThird::getWeChatId);
                break;
            }
            case OpenIdLoginType.WE_COM: {
                userThirdManager.unbind(userId, UserThird::getWeComId);
                break;
            }
            case OpenIdLoginType.DING_TALK: {
                userThirdManager.unbind(userId, UserThird::getDingTalkId);
                break;
            }
            default: {
                throw new BizException("未被支持的三方登录方式");
            }
        }
    }
}

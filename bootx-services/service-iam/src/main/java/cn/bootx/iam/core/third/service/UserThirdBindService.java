package cn.bootx.iam.core.third.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.iam.code.OpenIdLoginType;
import cn.bootx.iam.core.third.dao.UserThirdInfoManager;
import cn.bootx.iam.core.third.dao.UserThirdManager;
import cn.bootx.iam.core.third.entity.UserThird;
import cn.bootx.starter.auth.authentication.OpenIdAuthentication;
import cn.bootx.starter.auth.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static cn.bootx.iam.code.OpenIdLoginType.WE_CHAT;


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
    private final List<OpenIdAuthentication> openIdAuthentications;

    /**
     * 绑定账号
     */
    @Transactional(rollbackFor = Exception.class)
    public void bind(String authCode, String clientCode, String state){
        OpenIdAuthentication openIdAuthentication = this.getOpenIdAuthentication(clientCode);
        openIdAuthentication.bindUser(authCode, state);
    }

    /**
     * 解除绑定
     */
    @Transactional
    public void unbind(String clientCode) {
        Long userId = SecurityUtil.getUserId();
        if (!userThirdManager.existedByUserId(userId)){
           throw new DataNotExistException("用户绑定关系不存");
        }
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
}

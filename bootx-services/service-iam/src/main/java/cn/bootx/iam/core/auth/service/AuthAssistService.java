package cn.bootx.iam.core.auth.service;

import cn.bootx.baseapi.core.captcha.service.CaptchaService;
import cn.bootx.common.core.exception.BizException;
import cn.bootx.iam.code.UserStatusCode;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.exception.user.UserInfoNotExistsException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * 认证支撑服务
 *
 * @author xxm
 * @date 2021/9/9
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AuthAssistService {

    private final CaptchaService captchaService;

    private final UserInfoManager userInfoManager;

    private final String smsCaptchaType = "login";

    /**
     * 发送短信验证码
     */
    public void sendSmsCaptcha(String phone) {
        // 判断用户是否存在
        UserInfo userInfo = userInfoManager.findByPhone(phone).orElseThrow(UserInfoNotExistsException::new);

        if (userInfo.getStatus() != UserStatusCode.NORMAL) {
            throw new BizException("用户状态异常");
        }
        // 有效期5分钟
        captchaService.sendSmsCaptcha(phone, 5 * 60, smsCaptchaType);
    }

}

package cn.bootx.iam.core.auth.service;

import cn.bootx.baseapi.core.captcha.service.CaptchaService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
* 认证支撑服务
* @author xxm
* @date 2021/9/9
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class AuthAssistService {
    private final CaptchaService captchaService;

    /**
     * 发送短信验证码
     * @param phone
     */
    public void sendSmsCaptcha(String phone) {
        captchaService.sendSmsCaptcha(phone,5*60);
    }
}

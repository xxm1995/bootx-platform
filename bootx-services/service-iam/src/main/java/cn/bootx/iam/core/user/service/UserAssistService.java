package cn.bootx.iam.core.user.service;

import cn.bootx.baseapi.core.captcha.service.CaptchaService;
import cn.bootx.common.websocket.entity.WsRes;
import cn.bootx.common.websocket.service.UserWsNoticeService;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.exception.user.UserInfoNotExistsException;
import cn.bootx.starter.auth.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**   
* 用户操作支撑服务
* @author xxm  
* @date 2022/6/19 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class UserAssistService {
    private final UserInfoManager userInfoManager;
    private final CaptchaService captchaService;
    private final UserWsNoticeService userWsNoticeService;
    private final String changePhoneType = "change:phone";
    private final String changeEmailType = "change:email";

    /**
     * 给当前用户发送更改手机号验证码
     */
    public void sendCurrentPhoneCaptcha(){
        UserInfo userInfo = userInfoManager.findById(SecurityUtil.getUserId()).orElseThrow(UserInfoNotExistsException::new);
        this.sendPhoneCaptcha(userInfo.getPhone());
    }


    /**
     * 验证当前用户发送更改手机号验证码
     */
    public boolean validateCurrentPhoneCaptcha(String captcha){
        UserInfo userInfo = userInfoManager.findById(SecurityUtil.getUserId()).orElseThrow(UserInfoNotExistsException::new);
        return this.validatePhoneCaptcha(userInfo.getPhone(),captcha);
    }

    /**
     * 发送更改手机号验证码
     */
    public void sendPhoneCaptcha(String phone){
        int captcha = captchaService.sendSmsCaptcha(phone, 15 * 60, changePhoneType);
        userWsNoticeService.sendMessageByUser(WsRes.notificationInfo("(开发模式)短信验证码 : "+captcha),SecurityUtil.getUserIdOrDefaultId());
    }

    /**
     * 验证改手机验证码
     */
    public boolean validatePhoneCaptcha(String phone, String captcha){
        return captchaService.validateSmsCaptcha(phone,captcha,changePhoneType);
    }

    /**
     * 删除手机验证码
     */
    public void deleteSmsCaptcha(String phone){
        captchaService.deleteSmsCaptcha(phone,changePhoneType);
    }

    /**
     * 给当前用户发送更改邮箱验证码
     */
    public void sendCurrentEmailCaptcha(){
        UserInfo userInfo = userInfoManager.findById(SecurityUtil.getUserId()).orElseThrow(UserInfoNotExistsException::new);
        this.sendEmailCaptcha(userInfo.getEmail());
    }

    /**
     * 验证当前用户发送更改邮箱验证码
     */
    public boolean validateCurrentEmailCaptcha(String captcha){
        UserInfo userInfo = userInfoManager.findById(SecurityUtil.getUserId()).orElseThrow(UserInfoNotExistsException::new);
        return this.validateEmailCaptcha(userInfo.getEmail(),captcha);
    }

    /**
     * 发送更改邮箱验证码
     */
    public void sendEmailCaptcha(String email){
        int captcha = captchaService.sendEmailCaptcha(email, 15 * 60, changeEmailType);
        userWsNoticeService.sendMessageByUser(WsRes.notificationInfo("(开发模式)邮件验证码 : "+captcha),SecurityUtil.getUserIdOrDefaultId());
    }

    /**
     * 验证改邮箱验证码
     */
    public boolean validateEmailCaptcha(String email, String captcha){
        return captchaService.validateEmailCaptcha(email,captcha,changeEmailType);
    }

    /**
     * 删除邮箱验证码
     */
    public void deleteEmailCaptcha(String email){
        captchaService.deleteEmailCaptcha(email,changeEmailType);
    }
}

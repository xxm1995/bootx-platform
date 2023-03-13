package cn.bootx.iam.core.user.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.iam.core.user.dao.UserExpandInfoManager;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserExpandInfo;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.dto.user.LoginAfterUserInfo;
import cn.bootx.iam.dto.user.UserBaseInfoDto;
import cn.bootx.iam.dto.user.UserInfoDto;
import cn.bootx.iam.exception.user.UserInfoNotExistsException;
import cn.bootx.iam.param.user.UserBaseInfoParam;
import cn.bootx.starter.auth.util.PasswordEncoder;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

/**
 * 用户
 *
 * @author xxm
 * @date 2020/4/27 21:11
 */
@Service
@RequiredArgsConstructor
public class UserInfoService {

    private final UserInfoManager userInfoManager;

    private final UserQueryService userQueryService;

    private final UserAssistService userAssistService;

    private final UserExpandInfoManager userExpandInfoManager;

    private final PasswordEncoder passwordEncoder;

    /**
     * 登录后获取用户信息
     */
    public LoginAfterUserInfo getLoginAfterUserInfo() {
        UserInfo userInfo = userInfoManager.findById(SecurityUtil.getUserId())
                .orElseThrow(UserInfoNotExistsException::new);
        UserExpandInfo userExpandInfo = userExpandInfoManager.findById(SecurityUtil.getUserId())
                .orElseThrow(UserInfoNotExistsException::new);
        return new LoginAfterUserInfo().setAvatar(userExpandInfo.getAvatar()).setUserId(userInfo.getId())
                .setUsername(userInfo.getUsername()).setName(userInfo.getName());
    }

    /**
     * 获取用户安全信息
     */
    public UserInfoDto getUserSecurityInfo() {
        return userInfoManager.findById(SecurityUtil.getUserId()).map(UserInfo::toDto)
                .orElseThrow(UserInfoNotExistsException::new);
    }

    /**
     * 获取用户基本信息
     */
    public UserBaseInfoDto getUserBaseInfo() {
        UserInfo userInfo = userInfoManager.findById(SecurityUtil.getUserId())
                .orElseThrow(UserInfoNotExistsException::new);
        UserExpandInfo userExpandInfo = userExpandInfoManager.findById(SecurityUtil.getUserId())
                .orElseThrow(UserInfoNotExistsException::new);
        return new UserBaseInfoDto().setId(userInfo.getId()).setSex(userExpandInfo.getSex()).setName(userInfo.getName())
                .setBirthday(userExpandInfo.getBirthday()).setAvatar(userExpandInfo.getAvatar());
    }

    /**
     * 修改基本信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateUserBaseInfo(UserBaseInfoParam param) {
        UserInfo userInfo = userInfoManager.findById(SecurityUtil.getUserId())
                .orElseThrow(UserInfoNotExistsException::new);
        UserExpandInfo userExpandInfo = userExpandInfoManager.findById(SecurityUtil.getUserId())
                .orElseThrow(UserInfoNotExistsException::new);
        param.setId(null);
        BeanUtil.copyProperties(param, userExpandInfo, CopyOptions.create().ignoreNullValue());
        BeanUtil.copyProperties(param, userInfo, CopyOptions.create().ignoreNullValue());
        userExpandInfoManager.updateById(userExpandInfo);
        userInfoManager.updateById(userInfo);
    }

    /**
     * 修改密码
     * @param password 原密码
     * @param newPassword 新密码
     */
    @Transactional(rollbackFor = Exception.class)
    public void updatePassword(String password, String newPassword) {
        UserInfo userInfo = userInfoManager.findById(SecurityUtil.getUserId())
                .orElseThrow(UserInfoNotExistsException::new);
        UserExpandInfo userExpandInfo = userExpandInfoManager.findById(SecurityUtil.getUserId())
                .orElseThrow(UserInfoNotExistsException::new);
        // 新密码进行加密
        newPassword = passwordEncoder.encode(newPassword);

        // 判断原有密码是否相同
        if (passwordEncoder.matches(password, userInfo.getPassword())) {
            throw new BizException("旧密码错误");
        }
        userInfo.setPassword(newPassword);
        userInfoManager.updateById(userInfo);
        userExpandInfo.setLastChangePasswordTime(LocalDateTime.now());
        userExpandInfoManager.updateById(userExpandInfo);
    }

    /**
     * 修改手机号
     * @param phone 要更更换的手机号
     * @param oldCaptcha 旧手机号的验证码
     * @param newCaptcha 新手机的验证码
     */
    @Transactional(rollbackFor = Exception.class)
    public void updatePhone(String phone, String oldCaptcha, String newCaptcha) {
        UserInfo userInfo = userInfoManager.findById(SecurityUtil.getUserId())
                .orElseThrow(UserInfoNotExistsException::new);
        // 判断旧手机的验证码是否正常
        if (!userAssistService.validatePhoneChangeCaptcha(userInfo.getPhone(), oldCaptcha)) {
            throw new BizException("短信验证码不正确");
        }
        // 判断新手机验证码是否正常
        if (!userAssistService.validatePhoneChangeCaptcha(phone, newCaptcha)) {
            throw new BizException("短信验证码不正确");
        }
        // 手机号是否已经存在
        if (userQueryService.existsPhone(phone)) {
            throw new BizException("该手机号已经被使用");
        }
        userAssistService.deletePhoneChangeCaptcha(userInfo.getPhone());
        userInfo.setPhone(phone);
        userInfoManager.updateById(userInfo);
        userAssistService.deletePhoneChangeCaptcha(phone);
    }

    /**
     * 更改邮箱
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateEmail(String email, String oldCaptcha, String newCaptcha) {
        UserInfo userInfo = userInfoManager.findById(SecurityUtil.getUserId())
                .orElseThrow(UserInfoNotExistsException::new);
        // 判断旧手机的验证码是否正常
        if (!userAssistService.validatePhoneChangeCaptcha(userInfo.getPhone(), oldCaptcha)) {
            throw new BizException("短信验证码不正确");
        }
        // 判断新邮箱验证码是否正常
        if (!userAssistService.validatePhoneChangeCaptcha(email, newCaptcha)) {
            throw new BizException("短信验证码不正确");
        }
        // 邮箱是否已经存在
        if (!userQueryService.existsEmail(email)) {
            throw new BizException("该邮箱已经被使用");
        }
        userAssistService.deleteEmailChangeCaptcha(userInfo.getEmail());
        userInfo.setEmail(email);
        userInfoManager.updateById(userInfo);
        userAssistService.deleteEmailChangeCaptcha(email);
    }

    /**
     * 找回密码 手机
     */
    @Transactional(rollbackFor = Exception.class)
    public void forgetPasswordByPhone(String phone, String captcha, String password) {
        if (!userAssistService.validatePhoneForgetCaptcha(phone, captcha)) {
            throw new BizException("短信验证码不正确");
        }
        UserInfo userInfo = userInfoManager.findByPhone(phone).orElseThrow(UserInfoNotExistsException::new);
        UserExpandInfo userExpandInfo = userExpandInfoManager.findById(userInfo.getId())
                .orElseThrow(UserInfoNotExistsException::new);
        userInfo.setPassword(passwordEncoder.encode(password));
        userExpandInfo.setLastChangePasswordTime(LocalDateTime.now()).setInitialPassword(false);
        userInfoManager.updateById(userInfo);
        userExpandInfoManager.updateById(userExpandInfo);
        userAssistService.deletePhoneForgetCaptcha(phone);
    }

    /**
     * 找回密码 邮箱
     */
    public void forgetPasswordByEmail(String email, String captcha, String password) {
        if (!userAssistService.validateEmailForgetCaptcha(email, captcha)) {
            throw new BizException("短信验证码不正确");
        }
        UserInfo userInfo = userInfoManager.findByEmail(email).orElseThrow(UserInfoNotExistsException::new);
        UserExpandInfo userExpandInfo = userExpandInfoManager.findById(userInfo.getId())
                .orElseThrow(UserInfoNotExistsException::new);
        userInfo.setPassword(passwordEncoder.encode(password));
        userExpandInfo.setLastChangePasswordTime(LocalDateTime.now()).setInitialPassword(false);
        userInfoManager.updateById(userInfo);
        userExpandInfoManager.updateById(userExpandInfo);
        userAssistService.deleteEmailForgetCaptcha(email);
    }

    /**
     * 绑定手机号
     */
    public void bindPhone(String phone, String captcha) {
        UserInfo userInfo = userInfoManager.findById(SecurityUtil.getUserId())
                .orElseThrow(UserInfoNotExistsException::new);
        // 判断新手机验证码是否正常
        if (!userAssistService.validatePhoneChangeCaptcha(phone, captcha)) {
            throw new BizException("短信验证码不正确");
        }
        // 手机号是否已经存在
        if (userQueryService.existsPhone(phone)) {
            throw new BizException("该手机号已经被使用");
        }
        userInfo.setPhone(phone);
        userInfoManager.updateById(userInfo);
        userAssistService.deletePhoneChangeCaptcha(phone);
    }

    /**
     * 绑定邮箱
     */
    public void bindEmail(String email, String captcha) {
        UserInfo userInfo = userInfoManager.findById(SecurityUtil.getUserId())
                .orElseThrow(UserInfoNotExistsException::new);
        // 判断新邮箱验证码是否正常
        if (!userAssistService.validateEmailChangeCaptcha(email, captcha)) {
            throw new BizException("短信验证码不正确");
        }
        // 邮箱是否已经存在
        if (!userQueryService.existsEmail(email)) {
            throw new BizException("该邮箱已经被使用");
        }
        userInfo.setEmail(email);
        userInfoManager.updateById(userInfo);
        userAssistService.deleteEmailChangeCaptcha(userInfo.getEmail());
    }

}

package cn.bootx.iam.core.user.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.iam.core.user.dao.UserExpandInfoManager;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserExpandInfo;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.dto.user.LoginAfterUserInfo;
import cn.bootx.iam.dto.user.UserBaseInfoDto;
import cn.bootx.iam.exception.user.UserInfoNotExistsException;
import cn.bootx.iam.param.user.UserBaseInfoParam;
import cn.bootx.starter.auth.util.PasswordEncoder;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

/**
 * 用户
 * @author xxm
 * @date 2020/4/27 21:11
 */
@Service
@RequiredArgsConstructor
public class UserInfoService {

    private final UserInfoManager userInfoManager;
    private final UserExpandInfoManager userExpandInfoManager;
    private final PasswordEncoder passwordEncoder;

    /**
     * 修改密码
     * @param password      原密码
     * @param newPassword   新密码
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
        if (passwordEncoder.matches(password,userInfo.getPassword())){
            throw new BizException("旧密码错误");
        }
        userInfo.setPassword(newPassword);
        userInfoManager.updateById(userInfo);
        userExpandInfo.setLastChangePasswordTime(LocalDateTime.now());
        userExpandInfoManager.updateById(userExpandInfo);
    }

    /**
     * 登录后获取用户信息
     */
    public LoginAfterUserInfo getLoginAfterUserInfo(){
        UserInfo userInfo = userInfoManager.findById(SecurityUtil.getUserId())
                .orElseThrow(UserInfoNotExistsException::new);
        UserExpandInfo userExpandInfo = userExpandInfoManager.findById(SecurityUtil.getUserId())
                .orElseThrow(UserInfoNotExistsException::new);
        return new LoginAfterUserInfo().setAvatar(userExpandInfo.getAvatar())
                .setUsername(userInfo.getUsername())
                .setName(userInfo.getName());
    }

    /**
     * 获取用户基本信息
     */
    public UserBaseInfoDto getUserBaseInfo(){
        UserInfo userInfo = userInfoManager.findById(SecurityUtil.getUserId())
                .orElseThrow(UserInfoNotExistsException::new);
        UserExpandInfo userExpandInfo = userExpandInfoManager.findById(SecurityUtil.getUserId())
                .orElseThrow(UserInfoNotExistsException::new);
        return new UserBaseInfoDto()
                .setId(userInfo.getId())
                .setSex(userExpandInfo.getSex())
                .setName(userInfo.getName())
                .setBirthday(userExpandInfo.getBirthday())
                .setAvatar(userExpandInfo.getAvatar());
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
        BeanUtil.copyProperties(param,userExpandInfo, CopyOptions.create().ignoreNullValue());
        BeanUtil.copyProperties(param,userInfo, CopyOptions.create().ignoreNullValue());
        userExpandInfoManager.updateById(userExpandInfo);
        userInfoManager.updateById(userInfo);
    }

    /**
     * 账号是否存在
     */
    public boolean existsUsername(String username) {
        if (StrUtil.isBlank(username)) {
            return false;
        }
        return userInfoManager.existsByUsername(username.trim());
    }

    /**
     * 账号是否存在
     */
    public boolean existsUsername(String username,Long id) {
        return userInfoManager.existsByUsername(username.trim(),id);
    }

    /**
     * 邮箱是否存在
     */
    public boolean existsEmail(String email) {
        if (StrUtil.isBlank(email)) {
            return false;
        }
        return userInfoManager.existsByEmail(email.trim());
    }

    /**
     * 邮箱是否存在
     */
    public boolean existsEmail(String email,Long id) {
        return userInfoManager.existsByEmail(email.trim(),id);
    }

    /**
     * 手机是否存在
     */
    public boolean existsPhone(String phone) {
        if (StrUtil.isBlank(phone)) {
            return false;
        }
        return userInfoManager.existsByPhone(phone);
    }

    /**
     * 手机是否存在
     */
    public boolean existsPhone(String phone,Long id) {
        return userInfoManager.existsByPhone(phone.trim(),id);
    }

}

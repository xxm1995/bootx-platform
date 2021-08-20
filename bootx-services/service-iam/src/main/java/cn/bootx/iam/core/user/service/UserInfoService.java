package cn.bootx.iam.core.user.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.dto.user.UserInfoDto;
import cn.bootx.iam.exception.user.UserInfoNotExistsException;
import cn.bootx.iam.exception.user.UserNonePhoneAndEmailException;
import cn.bootx.iam.param.user.UserInfoParam;
import cn.bootx.starter.auth.util.PasswordEncoder;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;
import java.util.Objects;

/**
 * 用户
 * @author xxm
 * @date 2020/4/27 21:11
 */
@Service
@RequiredArgsConstructor
public class UserInfoService {

    private final UserInfoManager userInfoManager;
    private final PasswordEncoder passwordEncoder;

    /**
     * 根据用户id 获取 UserInfo
     */
    public UserInfoDto findById(Long id){
        return userInfoManager.findById(id).map(UserInfo::toDto).orElse(null);
    }

    /**
     * 根据账号查询用户
     */
    public UserInfoDto findByAccount(String account) {
        return userInfoManager.findByUsername(account).map(UserInfo::toDto).orElse(null);
    }
    /**
     * 根据邮箱查询用户
     */
    public UserInfoDto findByEmail(String email) {
        return userInfoManager.findByEmail(email).map(UserInfo::toDto).orElse(null);
    }

    /**
     * 根据手机号查询用户
     */
    public UserInfoDto findByPhone(String phone) {
        return userInfoManager.findByPhone(phone).map(UserInfo::toDto).orElse(null);
    }

    /**
     * 注册新用户 返回添加后用户信息, 已经存在则直接返回
     */
    @Transactional(rollbackFor = Exception.class)
    public UserInfoDto add(UserInfoParam userInfoParam){

        // 如果用户的手机号和邮箱都不存在则抛出异常, 第三方登录除外
        if (Objects.isNull(userInfoParam.getPhone()) && Objects.isNull(userInfoParam.getEmail())) {
            throw new UserNonePhoneAndEmailException();
        }

        if (this.existsUsername(userInfoParam.getUsername())){
            throw new BizException("账号已存在");
        }
        if (this.existsEmail(userInfoParam.getEmail())) {
            throw new BizException("邮箱已存在");
        }
        if (existsPhone(userInfoParam.getPhone())) {
            throw new BizException("手机号已存在");
        }
        // 注册时间
        UserInfo userInfo = UserInfo.init(userInfoParam);
        userInfo.setRegisterTime(LocalDateTime.now());
        return userInfoManager.save(userInfo).toDto();
    }

    /**
     * 修改密码
     * @param userId 当前用ID
     * @param password      原密码
     * @param newPassword   新密码
     */
    public void updatePassword(Long userId, String password, String newPassword) {
        UserInfo userInfo = userInfoManager.findById(userId)
                .orElseThrow(() -> new BizException("用户不存在"));

        // 新密码进行加密
        newPassword = passwordEncoder.encode(newPassword);

        // 判断原有密码是否相同
        if (passwordEncoder.matches(password,userInfo.getPassword())){
            throw new BizException("旧密码错误");
        }
        userInfo.setPassword(newPassword);
        userInfoManager.updateById(userInfo);
    }

    /**
     * 重置密码
     */
    public void restartPassword(Long userId,@NotBlank(message = "新密码不能为空") String newPassword){

        UserInfo userInfo = userInfoManager.findById(userId)
                .orElseThrow(() -> new BizException("用户不存在"));
        // 新密码进行加密
        newPassword = passwordEncoder.encode(newPassword);
        userInfo.setPassword(newPassword);
        userInfoManager.updateById(userInfo);
    }

    /**
     * 编辑用户信息
     */
    public UserInfoDto update(UserInfoParam userInfoParam){
        UserInfo userInfo = userInfoManager.findById(userInfoParam.getId()).orElseThrow(UserInfoNotExistsException::new);
        BeanUtil.copyProperties(userInfoParam,userInfo, CopyOptions.create().ignoreNullValue());
        return userInfoManager.updateById(userInfo).toDto();
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
     * 邮箱是否存在
     */
    public boolean existsEmail(String email) {
        if (StrUtil.isBlank(email)) {
            return false;
        }
        return userInfoManager.existsByEmail(email.trim());
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
     * 账户是否存在
     */
    public boolean existsById(Long id) {
        if (Objects.isNull(id)) {
            return false;
        }
        return userInfoManager.existsById(id);
    }
}

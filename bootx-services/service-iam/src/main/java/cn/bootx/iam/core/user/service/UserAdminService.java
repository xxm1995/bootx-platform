package cn.bootx.iam.core.user.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.iam.code.UserStatusCode;
import cn.bootx.iam.core.upms.service.UserRoleService;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.dto.dept.DeptDto;
import cn.bootx.iam.dto.upms.RoleDto;
import cn.bootx.iam.dto.user.UserInfoDto;
import cn.bootx.iam.dto.user.UserInfoWhole;
import cn.bootx.iam.exception.user.UserInfoNotExistsException;
import cn.bootx.iam.exception.user.UserNonePhoneAndEmailException;
import cn.bootx.iam.param.user.UserInfoParam;
import cn.bootx.starter.auth.util.PasswordEncoder;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

/**
* 超级管理员操作类
* @author xxm
* @date 2021/9/6
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class UserAdminService {
    private final UserInfoManager userInfoManager;
    private final UserRoleService userRoleService;
    private final UserDeptService userDeptService;
    private final PasswordEncoder passwordEncoder;
    private final UserInfoService userInfoService;

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
     * 锁定用户
     */
    public void lock(Long userId){
        userInfoManager.setUpStatus(userId,UserStatusCode.BAN);
    }

    /**
     * 解锁用户
     */
    public void unlock(Long userId){
        userInfoManager.setUpStatus(userId,UserStatusCode.NORMAL);
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

        if (userInfoService.existsUsername(userInfoParam.getUsername())){
            throw new BizException("账号已存在");
        }
        if (userInfoService.existsEmail(userInfoParam.getEmail())) {
            throw new BizException("邮箱已存在");
        }
        if (userInfoService.existsPhone(userInfoParam.getPhone())) {
            throw new BizException("手机号已存在");
        }
        // 注册时间
        UserInfo userInfo = UserInfo.init(userInfoParam);
        userInfo.setAdmin(false)
                .setStatus(UserStatusCode.NORMAL)
                .setPassword(passwordEncoder.encode(userInfo.getPassword()))
        .setRegisterTime(LocalDateTime.now());
        return userInfoManager.save(userInfo).toDto();
    }

    /**
     * 分页查询
     */
    public PageResult<UserInfoDto> page(PageParam pageParam, UserInfoParam userInfoParam){
        return MpUtils.convert2PageResult(userInfoManager.page(pageParam,userInfoParam));
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
     * 获取用户详情
     */
    public UserInfoWhole getUserInfoWhole(Long userId) {
        // 用户信息
        UserInfo userInfo = userInfoManager.findById(userId).orElseThrow(UserInfoNotExistsException::new);

        // 角色信息
        List<RoleDto> rolesByUser = userRoleService.findRolesByUser(userId);

        // 部门组织
        List<DeptDto> deptListByUser = userDeptService.findDeptListByUser(userId);

        return new UserInfoWhole()
                .setUserInfo(userInfo.toDto())
                .setRoles(rolesByUser)
                .setDeptList(deptListByUser);
    }
}

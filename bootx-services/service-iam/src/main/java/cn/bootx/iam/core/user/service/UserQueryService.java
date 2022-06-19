package cn.bootx.iam.core.user.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.dto.user.UserInfoDto;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
* 用户信息查询服务
* @author xxm
* @date 2022/6/19
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class UserQueryService {
    private final UserInfoManager userInfoManager;

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


    /**
     * 根据用户id 获取 UserInfo
     */
    public UserInfoDto findById(Long id){
        return userInfoManager.findById(id).map(UserInfo::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 根据账号查询用户
     */
    public UserInfoDto findByAccount(String account) {
        return userInfoManager.findByUsername(account).map(UserInfo::toDto).orElseThrow(DataNotExistException::new);
    }
    /**
     * 根据邮箱查询用户
     */
    public UserInfoDto findByEmail(String email) {
        return userInfoManager.findByEmail(email).map(UserInfo::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 根据手机号查询用户
     */
    public UserInfoDto findByPhone(String phone) {
        return userInfoManager.findByPhone(phone).map(UserInfo::toDto).orElseThrow(DataNotExistException::new);
    }

}

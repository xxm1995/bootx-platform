package cn.bootx.starter.auth.util;

import cn.bootx.common.core.code.CommonCode;
import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.entity.UserDetail;
import cn.dev33.satoken.exception.SaTokenException;
import cn.dev33.satoken.stp.StpUtil;
import lombok.experimental.UtilityClass;

import java.util.Optional;

/**
*
* @author xxm
* @date 2021/8/2
*/
@UtilityClass
public class SecurityUtil {

    /**
     * 获取当前用户,无异常
     * @return 当前登录用户名
     */
    public Optional<UserDetail> getCurrentUser() {
        try {
            return Optional.ofNullable(StpUtil.getSession())
                    .map(saSession -> saSession.getModel(CommonCode.USER,UserDetail.class));
        } catch (SaTokenException e) {
            return Optional.empty();
        }
    }

    /**
     * 获取用户id
     */
    public Long getUserId(){
        return getCurrentUser().map(UserDetail::getId).orElseThrow(() -> new BizException("未登录"));
    }

    /**
     * 获取用户
     */
    public UserDetail getUser(){
        return getCurrentUser().orElseThrow(() -> new BizException("未登录"));
    }
}

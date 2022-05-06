package cn.bootx.starter.auth.util;

import cn.bootx.common.core.code.CommonCode;
import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.starter.auth.exception.NotLoginException;
import cn.bootx.starter.auth.cache.SessionCacheLocal;
import cn.dev33.satoken.exception.SaTokenException;
import cn.dev33.satoken.stp.StpUtil;
import lombok.experimental.UtilityClass;
import org.springframework.lang.Nullable;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;
import java.util.Optional;

/**
* 安全工具类
* @author xxm
* @date 2021/8/2
*/
@UtilityClass
public class SecurityUtil {
    private final String CLIENT_PARAMETER = "client";

    /**
     * 获取当前用户,无异常
     * @return 当前登录用户
     */
    public Optional<UserDetail> getCurrentUser() {
        return getCurrentUser0();
    }

    /**
     * 获取用户id
     */
    public Long getUserId(){
        return getCurrentUser().map(UserDetail::getId).orElseThrow(NotLoginException::new);
    }

    /**
     * 获取用户
     */
    public UserDetail getUser(){
        return getCurrentUser().orElseThrow(NotLoginException::new);
    }

    /**
     * 获取登录方式
     */
    @Nullable
    public String getClientType(HttpServletRequest request) {
        return request.getParameter(CLIENT_PARAMETER);
    }

    /**
     * 获取当前用户,无异常, 使用线程缓存来减少redis的访问频率
     */
    private Optional<UserDetail> getCurrentUser0(){
        Optional<UserDetail> userDetail = SessionCacheLocal.get();
        if (Objects.isNull(userDetail)){
            try {
                userDetail = Optional.ofNullable(StpUtil.getSession())
                        .map(saSession -> saSession.getModel(CommonCode.USER,UserDetail.class));
            } catch (SaTokenException e) {
                userDetail = Optional.empty();
            }
            SessionCacheLocal.put(userDetail);
        }
        return userDetail;
    }
}

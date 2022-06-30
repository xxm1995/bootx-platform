package cn.bootx.starter.auth.impl;


import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.starter.auth.authentication.RouterCheck;
import cn.bootx.starter.auth.configuration.AuthProperties;
import cn.bootx.starter.auth.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

/**   
* 超级管理员跳过各种限制
* @author xxm  
* @date 2022/5/27 
*/
@Component
@RequiredArgsConstructor
public class IgnoreAdminUserRouterCheck implements RouterCheck {
    private final AuthProperties authProperties;
    @Override
    public int sortNo() {
        return 0;
    }

    @Override
    public boolean check(Object handler) {
        if (authProperties.isEnableAdmin()){
            UserDetail userDetail = SecurityUtil.getCurrentUser().orElse(new UserDetail());
            return userDetail.isAdmin();
        }
        return false;
    }
}

package cn.bootx.iam.core.user.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.iam.core.user.entity.UserSocialLogin;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**   
* 三方登录
* @author xxm  
* @date 2021/8/2 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class UserSocialLoginManager extends BaseManager<UserSocialLoginMapper, UserSocialLogin> {

    public Optional<UserSocialLogin> findByUserId(Long userId){
        return findByField(UserSocialLogin::getUserId,userId);
    }

    public Page<UserSocialLogin> page(PageParam pageParam) {
        Page<UserSocialLogin> mpPage = MpUtils.getMpPage(pageParam, UserSocialLogin.class);
        return lambdaQuery().page(mpPage);
    }
}

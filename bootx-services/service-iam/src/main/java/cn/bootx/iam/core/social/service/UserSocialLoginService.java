package cn.bootx.iam.core.social.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.user.dao.UserInfoManager;
import cn.bootx.iam.core.social.dao.UserSocialLoginManager;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.core.social.entity.UserSocialLogin;
import cn.bootx.iam.dto.user.UserSocialLoginDto;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;
import java.util.function.BiConsumer;


/**
 * 三方登录
 * @author xxm
 * @date 2021/8/2
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class UserSocialLoginService {
    private final UserSocialLoginManager userSocialLoginManager;
    private final UserInfoManager userInfoManager;

    /**
     * 绑定微信
     */
    public void bindWeChat(Long userId,String openId){
        this.bindOpenId(userId,openId,UserSocialLogin::setWeChatId);
    }

    /**
     * 绑定QQ
     */
    public void bindQq(Long userId,String openId){
        this.bindOpenId(userId,openId,UserSocialLogin::setQqId);
    }

    /**
     * 分页
     */
    public PageResult<UserSocialLoginDto> page(PageParam pageParam){
        return MpUtil.convert2PageResult(userSocialLoginManager.page(pageParam));
    }

    /**
     * 分页
     */
    public UserSocialLoginDto findById(Long id){
        return userSocialLoginManager.findById(id).map(UserSocialLogin::toDto)
                .orElse(null);
    }

    /**
     * 查询
     */
    private UserSocialLogin findByOpenid(String openId, SFunction<UserSocialLogin, String> function){
        return userSocialLoginManager.findByField(function,openId)
                .orElse(null);
    }

    /**
     * 绑定
     */
    private void bindOpenId(Long userId,String openId,BiConsumer<UserSocialLogin, String> function){
        UserSocialLogin userSocialLogin = userSocialLoginManager.findByUserId(userId)
                .orElse(null);
        if (Objects.isNull(userSocialLogin)){
            UserInfo userInfo = userInfoManager.findById(userId)
                    .orElseThrow(() -> new BizException("用户不存在"));
            userSocialLogin = new UserSocialLogin();
            userSocialLogin.setUserId(userInfo.getId());
            function.accept(userSocialLogin,openId);
            userSocialLoginManager.save(userSocialLogin);
        } else {
            function.accept(userSocialLogin,openId);
            userSocialLoginManager.updateById(userSocialLogin);
        }
    }
}

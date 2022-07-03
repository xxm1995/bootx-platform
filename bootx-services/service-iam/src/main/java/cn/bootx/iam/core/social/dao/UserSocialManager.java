package cn.bootx.iam.core.social.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.social.entity.UserSocial;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
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
public class UserSocialManager extends BaseManager<UserSocialMapper, UserSocial> {

    public Optional<UserSocial> findByUserId(Long userId){
        return findByField(UserSocial::getUserId,userId);
    }

    /**
     * 解绑
     */
    public void unbind(Long userId, SFunction<UserSocial, String> function){
        this.lambdaUpdate()
                .set(function,null)
                .eq(UserSocial::getUserId,userId)
                .update();
    }

    public Page<UserSocial> page(PageParam pageParam) {
        Page<UserSocial> mpPage = MpUtil.getMpPage(pageParam, UserSocial.class);
        return lambdaQuery()
                .orderByDesc(MpBaseEntity::getId)
                .page(mpPage);
    }
}

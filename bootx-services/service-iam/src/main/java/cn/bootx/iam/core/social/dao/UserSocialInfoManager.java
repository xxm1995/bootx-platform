package cn.bootx.iam.core.social.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.social.entity.UserSocialInfo;
import cn.bootx.iam.param.user.UserSocialInfoParam;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * 用户三方登录绑定详情
 * @author xxm
 * @date 2022-07-02
 */
@Repository
@RequiredArgsConstructor
public class UserSocialInfoManager extends BaseManager<UserSocialInfoMapper, UserSocialInfo> {

    /**
    * 分页
    */
    public Page<UserSocialInfo> page(PageParam pageParam, UserSocialInfoParam param) {
        Page<UserSocialInfo> mpPage = MpUtil.getMpPage(pageParam, UserSocialInfo.class);
        return lambdaQuery().orderByDesc(MpBaseEntity::getId).page(mpPage);
    }

    /**
     * 根据用户id查询
     */
    public List<UserSocialInfo> findAllByUser(Long userId){
        return this.findAllByField(UserSocialInfo::getUserId,userId);
    }

    /**
     * 根据用户id和终端Code查询
     */
    public Optional<UserSocialInfo> findByUserAndClientCode(Long userId,String clientCode){
        return lambdaQuery()
                .eq(UserSocialInfo::getUserId,userId)
                .eq(UserSocialInfo::getClientCode,clientCode)
                .oneOpt();
    }
    /**
     * 删除指定类型
     */
    public void deleteByUserAndClientCode(Long userId,String clientCode){
        lambdaUpdate()
                .eq(UserSocialInfo::getUserId,userId)
                .eq(UserSocialInfo::getClientCode,clientCode)
                .remove();
    }

}
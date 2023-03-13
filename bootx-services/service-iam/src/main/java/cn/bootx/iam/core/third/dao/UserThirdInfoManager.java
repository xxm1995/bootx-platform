package cn.bootx.iam.core.third.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.third.entity.UserThirdInfo;
import cn.bootx.iam.param.user.UserThirdInfoParam;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * 用户三方登录绑定详情
 *
 * @author xxm
 * @date 2022-07-02
 */
@Repository
@RequiredArgsConstructor
public class UserThirdInfoManager extends BaseManager<UserThirdInfoMapper, UserThirdInfo> {

    /**
     * 分页
     */
    public Page<UserThirdInfo> page(PageParam pageParam, UserThirdInfoParam param) {
        Page<UserThirdInfo> mpPage = MpUtil.getMpPage(pageParam, UserThirdInfo.class);
        return lambdaQuery().orderByDesc(MpIdEntity::getId).page(mpPage);
    }

    /**
     * 根据用户id查询
     */
    public List<UserThirdInfo> findAllByUser(Long userId) {
        return this.findAllByField(UserThirdInfo::getUserId, userId);
    }

    /**
     * 根据用户id和终端Code查询
     */
    public Optional<UserThirdInfo> findByUserAndClientCode(Long userId, String clientCode) {
        return lambdaQuery().eq(UserThirdInfo::getUserId, userId).eq(UserThirdInfo::getClientCode, clientCode).oneOpt();
    }

    /**
     * 删除指定类型
     */
    public void deleteByUserAndClientCode(Long userId, String clientCode) {
        lambdaUpdate().eq(UserThirdInfo::getUserId, userId).eq(UserThirdInfo::getClientCode, clientCode).remove();
    }

}
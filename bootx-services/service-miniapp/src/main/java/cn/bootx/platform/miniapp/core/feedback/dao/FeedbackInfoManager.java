package cn.bootx.platform.miniapp.core.feedback.dao;

import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.common.mybatisplus.impl.BaseManager;
import cn.bootx.platform.common.mybatisplus.util.MpUtil;
import cn.bootx.platform.common.query.generator.QueryGenerator;
import cn.bootx.platform.miniapp.core.feedback.entity.FeedbackInfo;
import cn.bootx.platform.miniapp.param.feedback.FeedbackInfoParam;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * 用户反馈信息
 * @author xxm
 * @since 2023-08-15
 */
@Repository
@RequiredArgsConstructor
public class FeedbackInfoManager extends BaseManager<FeedbackInfoMapper, FeedbackInfo> {

    /**
    * 分页
    */
    public Page<FeedbackInfo> page(PageParam pageParam, FeedbackInfoParam param) {
        Page<FeedbackInfo> mpPage = MpUtil.getMpPage(pageParam, FeedbackInfo.class);
        QueryWrapper<FeedbackInfo> wrapper = QueryGenerator.generator(param, this.getEntityClass());
        wrapper.select(this.getEntityClass(),MpUtil::excludeBigField)
                .orderByDesc(MpUtil.getColumnName(FeedbackInfo::getId));
        return this.page(mpPage,wrapper);
    }
}

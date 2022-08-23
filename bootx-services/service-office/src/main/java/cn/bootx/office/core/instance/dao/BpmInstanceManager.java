package cn.bootx.office.core.instance.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.office.param.instance.BpmInstanceParam;
import cn.bootx.office.core.instance.entity.BpmInstance;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.common.mybatisplus.util.MpUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * 流程实例扩展
 * @author xxm
 * @date 2022-08-23
 */
@Repository
@RequiredArgsConstructor
public class BpmInstanceManager extends BaseManager<BpmInstanceMapper, BpmInstance> {

    /**
    * 分页
    */
    public Page<BpmInstance> page(PageParam pageParam, BpmInstanceParam param) {
        Page<BpmInstance> mpPage = MpUtil.getMpPage(pageParam, BpmInstance.class);
        return this.lambdaQuery()
                .select(this.getEntityClass(),MpUtil::excludeBigField)
                .orderByDesc(MpIdEntity::getId)
                .page(mpPage);
    }
}
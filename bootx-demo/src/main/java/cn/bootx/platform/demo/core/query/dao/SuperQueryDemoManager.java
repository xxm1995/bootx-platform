package cn.bootx.platform.demo.core.query.dao;

import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.common.mybatisplus.impl.BaseManager;
import cn.bootx.platform.common.mybatisplus.util.MpUtil;
import cn.bootx.platform.common.query.generator.QueryGenerator;
import cn.bootx.platform.demo.core.query.entity.SuperQueryDemo;
import cn.bootx.platform.common.query.entity.QueryParams;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**
 * 超级查询
 *
 * @author xxm
 * @since 2022/2/21
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class SuperQueryDemoManager extends BaseManager<SuperQueryDemoMapper, SuperQueryDemo> {

    /**
     * 分页
     */
    public Page<SuperQueryDemo> page(PageParam pageParam) {
        Page<SuperQueryDemo> mpPage = MpUtil.getMpPage(pageParam, SuperQueryDemo.class);
        return lambdaQuery().orderByDesc(SuperQueryDemo::getCreateTime).page(mpPage);
    }

    /**
     * 分页 超级查询
     */
    public Page<SuperQueryDemo> superQuery(PageParam pageParam, QueryParams queryParams) {
        QueryWrapper<SuperQueryDemo> generator = QueryGenerator.generator(queryParams);
        Page<SuperQueryDemo> mpPage = MpUtil.getMpPage(pageParam, SuperQueryDemo.class);
        return this.page(mpPage, generator);
    }

}

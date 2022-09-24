package cn.bootx.baseapi.core.dynamicsource.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.baseapi.param.dynamicsource.DynamicDataSourceParam;
import cn.bootx.baseapi.core.dynamicsource.entity.DynamicDataSource;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * 动态数据源管理
 * @author xxm
 * @date 2022-09-24
 */
@Repository
@RequiredArgsConstructor
public class DynamicDataSourceManager extends BaseManager<DynamicDataSourceMapper, DynamicDataSource> {

    /**
    * 分页
    */
    public Page<DynamicDataSource> page(PageParam pageParam, DynamicDataSourceParam param) {
        Page<DynamicDataSource> mpPage = MpUtil.getMpPage(pageParam, DynamicDataSource.class);
        return this.lambdaQuery()
                .select(this.getEntityClass(),MpUtil::excludeBigField)
                .orderByDesc(MpIdEntity::getId)
                .page(mpPage);
    }
}
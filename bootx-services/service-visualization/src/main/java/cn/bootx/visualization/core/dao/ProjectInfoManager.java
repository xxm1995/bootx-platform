package cn.bootx.visualization.core.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.visualization.core.entity.ProjectInfo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Repository;

/**
 *
 * @author xxm
 * @date 2023/2/21
 */
@Repository
public class ProjectInfoManager extends BaseManager<ProjectInfoMapper, ProjectInfo> {

    public Page<ProjectInfo> page(PageParam pageParam) {
        Page<ProjectInfo> mpPage = MpUtil.getMpPage(pageParam, ProjectInfo.class);
        return this.lambdaQuery()
                .orderByDesc(MpIdEntity::getId)
                .page(mpPage);
    }
}

package cn.bootx.platform.visualization.core.dao;

import cn.bootx.platform.visualization.param.ProjectInfoSave;
import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.common.mybatisplus.base.MpIdEntity;
import cn.bootx.platform.common.mybatisplus.impl.BaseManager;
import cn.bootx.platform.common.mybatisplus.util.MpUtil;
import cn.bootx.platform.visualization.core.entity.ProjectInfo;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.stereotype.Repository;

import java.util.Objects;

/**
 * @author xxm
 * @date 2023/2/21
 */
@Repository
public class ProjectInfoManager extends BaseManager<ProjectInfoMapper, ProjectInfo> {

    /**
     * 分页
     */
    public Page<ProjectInfo> page(PageParam pageParam, ProjectInfoSave query) {
        Page<ProjectInfo> mpPage = MpUtil.getMpPage(pageParam, ProjectInfo.class);
        return this.lambdaQuery()
            .select(this.getEntityClass(), MpUtil::excludeBigField)
            .orderByDesc(MpIdEntity::getId)
            .like(Objects.nonNull(query.getProjectId()), MpIdEntity::getId, query.getProjectId())
            .like(StrUtil.isNotBlank(query.getName()), ProjectInfo::getName, query.getName())
            .eq(Objects.nonNull(query.getState()), ProjectInfo::getState, query.getState())
            .page(mpPage);
    }

}

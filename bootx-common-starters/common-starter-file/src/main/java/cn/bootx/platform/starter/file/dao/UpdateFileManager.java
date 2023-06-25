package cn.bootx.platform.starter.file.dao;

import cn.bootx.platform.starter.file.entity.UpdateFileInfo;
import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.common.mybatisplus.impl.BaseManager;
import cn.bootx.platform.common.mybatisplus.util.MpUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**
 * @author xxm
 * @since 2022/1/12
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class UpdateFileManager extends BaseManager<UpdateFileMapper, UpdateFileInfo> {

    /**
     * 分页
     */
    public Page<UpdateFileInfo> page(PageParam pageParam) {
        Page<UpdateFileInfo> mpPage = MpUtil.getMpPage(pageParam, UpdateFileInfo.class);
        return lambdaQuery().orderByDesc(UpdateFileInfo::getId).page(mpPage);
    }

}

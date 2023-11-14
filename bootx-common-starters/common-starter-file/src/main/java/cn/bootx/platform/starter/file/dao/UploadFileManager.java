package cn.bootx.platform.starter.file.dao;

import cn.bootx.platform.starter.file.entity.UploadFileInfo;
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
public class UploadFileManager extends BaseManager<UploadFileMapper, UploadFileInfo> {

    /**
     * 分页
     */
    public Page<UploadFileInfo> page(PageParam pageParam) {
        Page<UploadFileInfo> mpPage = MpUtil.getMpPage(pageParam, UploadFileInfo.class);
        return lambdaQuery().orderByDesc(UploadFileInfo::getId).page(mpPage);
    }

}

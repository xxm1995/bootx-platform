package cn.bootx.baseapi.core.app.dao;

import cn.bootx.baseapi.core.app.entity.AppVersion;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * app版本管理
 *
 * @author xxm
 * @date 2021/8/9
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class AppVersionManager extends BaseManager<AppVersionMapper, AppVersion> {

    public Page<AppVersion> page(PageParam pageParam) {
        Page<AppVersion> mpPage = MpUtil.getMpPage(pageParam, AppVersion.class);
        return lambdaQuery().orderByDesc(MpIdEntity::getId).page(mpPage);
    }

    public Optional<AppVersion> findLatest() {
        return MpUtil.findOne(lambdaQuery().orderByDesc(AppVersion::getAppVersion));
    }

}

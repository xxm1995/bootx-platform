package cn.bootx.iam.core.client.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.iam.core.client.entity.Application;
import cn.bootx.iam.param.client.ApplicationParam;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * 认证应用
 * @author xxm
 * @date 2022-06-27
 */
@Repository
@RequiredArgsConstructor
public class ApplicationManager extends BaseManager<ApplicationMapper, Application> {
    private final ApplicationMapper mapper;

    /**
    * 分页
    */
    public Page<Application> page(PageParam pageParam, ApplicationParam param) {
        Page<Application> mpPage = MpUtil.getMpPage(pageParam, Application.class);
        return lambdaQuery().orderByDesc(MpBaseEntity::getId).page(mpPage);
    }

    public Optional<Application> findByCode(String code) {
        return findByField(Application::getCode,code);
    }
}
package cn.bootx.platform.iam.dao.config;

import cn.bootx.platform.common.mybatisplus.impl.BaseManager;
import cn.bootx.platform.common.mybatisplus.query.generator.QueryGenerator;
import cn.bootx.platform.common.mybatisplus.util.MpUtil;
import cn.bootx.platform.core.rest.param.PageParam;
import cn.bootx.platform.iam.entity.security.LoginSecurityConfig;
import cn.bootx.platform.iam.param.security.LoginSecurityConfigParam;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

/**
 * 登录安全策略
 * @author xxm
 * @since 2024/12/12
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class LoginSecurityConfigManager extends BaseManager<LoginSecurityConfigMapper,LoginSecurityConfig> {

    /**
     * 分页
     */
    public Page<LoginSecurityConfig> page(PageParam pageParam, LoginSecurityConfigParam param) {
        Page<LoginSecurityConfig> mpPage = MpUtil.getMpPage(pageParam, LoginSecurityConfig.class);
        QueryWrapper<LoginSecurityConfig> wrapper = QueryGenerator.generator(param, this.getEntityClass());
        wrapper.select(this.getEntityClass(),MpUtil::excludeBigField)
                .orderByDesc(MpUtil.getColumnName(LoginSecurityConfig::getId));
        return this.page(mpPage,wrapper);
    }
}

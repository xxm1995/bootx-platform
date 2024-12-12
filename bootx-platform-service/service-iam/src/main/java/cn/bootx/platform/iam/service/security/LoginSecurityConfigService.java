package cn.bootx.platform.iam.service.security;


import cn.bootx.platform.common.mybatisplus.util.MpUtil;
import cn.bootx.platform.core.exception.DataNotExistException;
import cn.bootx.platform.core.rest.param.PageParam;
import cn.bootx.platform.core.rest.result.PageResult;
import cn.bootx.platform.iam.dao.config.LoginSecurityConfigManager;
import cn.bootx.platform.iam.entity.security.LoginSecurityConfig;
import cn.bootx.platform.iam.param.security.LoginSecurityConfigParam;
import cn.bootx.platform.iam.result.security.LoginSecurityConfigResult;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 登录安全策略
 * @author xxm
 * @since 2023-09-19
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class LoginSecurityConfigService {
    private final LoginSecurityConfigManager loginSecurityConfigManager;

    /**
     * 添加
     */
    public void add(LoginSecurityConfigParam param){
        LoginSecurityConfig loginSecurityConfig = LoginSecurityConfig.init(param);
        loginSecurityConfigManager.save(loginSecurityConfig);
    }

    /**
     * 修改
     */
    public void update(LoginSecurityConfigParam param){
        LoginSecurityConfig loginSecurityConfig = loginSecurityConfigManager.findById(param.getId())
                .orElseThrow(() -> new DataNotExistException("登录安全策略不存在"));

        BeanUtil.copyProperties(param,loginSecurityConfig, CopyOptions.create().ignoreNullValue());
        loginSecurityConfigManager.updateById(loginSecurityConfig);
    }

    /**
     * 分页
     */
    public PageResult<LoginSecurityConfigResult> page(PageParam pageParam, LoginSecurityConfigParam query){
        return MpUtil.toPageResult(loginSecurityConfigManager.page(pageParam, query));
    }

    /**
     * 获取单条
     */
    public LoginSecurityConfigResult findById(Long id){
        return loginSecurityConfigManager.findById(id).map(LoginSecurityConfig::toResult)
                .orElseThrow(() -> new DataNotExistException("登录安全策略不存在"));
    }

    /**
     * 获取全部
     */
    public List<LoginSecurityConfigResult> findAll(){
        return MpUtil.toListResult(loginSecurityConfigManager.findAll());
    }

    /**
     * 删除
     */
    public void delete(Long id){
        loginSecurityConfigManager.deleteById(id);
    }


    /**
     * 批量删除
     */
    public void deleteBatch(List<Long> ids){
        loginSecurityConfigManager.deleteByIds(ids);
    }
}

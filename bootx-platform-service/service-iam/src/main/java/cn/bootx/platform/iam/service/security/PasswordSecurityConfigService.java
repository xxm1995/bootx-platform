package cn.bootx.platform.iam.service.security;

import cn.bootx.platform.core.exception.DataNotExistException;
import cn.bootx.platform.iam.dao.config.PasswordSecurityConfigManager;
import cn.bootx.platform.iam.entity.security.PasswordSecurityConfig;
import cn.bootx.platform.iam.param.security.PasswordSecurityConfigParam;
import cn.bootx.platform.iam.result.security.PasswordSecurityConfigResult;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 密码安全配置
 * @author xxm
 * @since 2024/12/12
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class PasswordSecurityConfigService {
    private final PasswordSecurityConfigManager passwordSecurityConfigManager;

    /**
     * 添加or修改
     */
    public void addOrUpdate(PasswordSecurityConfigParam param){
        // 判断库里是否有数据
        if (passwordSecurityConfigManager.existsAll()){
            this.update(param);
        } else {
            this.add(param);
        }
    }

    /**
     * 添加
     */
    public void add(PasswordSecurityConfigParam param){
        PasswordSecurityConfig passwordSecurityConfig = PasswordSecurityConfig.init(param);
        passwordSecurityConfigManager.save(passwordSecurityConfig);
    }

    /**
     *  修改
     */
    private void update(PasswordSecurityConfigParam param){
        PasswordSecurityConfig passwordSecurityConfig = passwordSecurityConfigManager.findById(param.getId())
                .orElseThrow(() -> new DataNotExistException("密码安全策略不存在"));
        BeanUtil.copyProperties(param, passwordSecurityConfig, CopyOptions.create().ignoreNullValue());
        passwordSecurityConfigManager.updateById(passwordSecurityConfig);
    }

    /**
     * 获取配置项, 如有多个, 则取第一个并删除旧的数据, 如果未配置, 则取系统默认配置
     */
    public PasswordSecurityConfigResult getDefault(){
        List<PasswordSecurityConfig> configs = passwordSecurityConfigManager.findAll();
        if (configs.size()==1){
            return configs.getFirst().toResult();
        } else if (configs.size()>1){
            PasswordSecurityConfig securityConfig = configs.getFirst();
            passwordSecurityConfigManager.deleteAllNotId(securityConfig.getId());
            return securityConfig.toResult();
        } else {
            return PasswordSecurityConfigResult.defaultObject();
        }
    }
}

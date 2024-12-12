package cn.bootx.platform.iam.dao.config;

import cn.bootx.platform.common.mybatisplus.impl.BaseManager;
import cn.bootx.platform.iam.entity.security.PasswordSecurityConfig;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**
 * 密码安全配置
 * @author xxm
 * @since 2024/12/6
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class PasswordSecurityConfigManager extends BaseManager<PasswordSecurityConfigMapper, PasswordSecurityConfig> {

    /**
     * 表中是否有数据
     */
    public boolean existsAll(){
        return lambdaQuery().exists();
    }

    /**
     * 删除除指定的id外的所有密码安全策略
     */
    public void deleteAllNotId(Long id){
        this.lambdaUpdate().ne(PasswordSecurityConfig::getId,id).remove();
    }
}

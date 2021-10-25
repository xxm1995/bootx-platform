package cn.bootx.baseapi.core.config.dao;

import cn.bootx.baseapi.core.config.entity.SystemConfig;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**   
* 系统配置
* @author xxm  
* @date 2021/10/25 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class SystemConfigManager extends BaseManager<SystemConfigMapper, SystemConfig> {
}

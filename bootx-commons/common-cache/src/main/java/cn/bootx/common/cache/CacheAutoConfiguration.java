package cn.bootx.common.cache;

import org.springframework.boot.autoconfigure.AutoConfigurationPackage;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.ComponentScan;

/**   
 * 缓存配置
 * @author xxm  
 * @date 2022/12/18 
 */
@ComponentScan
@ConfigurationPropertiesScan
@AutoConfigurationPackage
public class CacheAutoConfiguration {
}

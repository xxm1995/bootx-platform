package cn.bootx.common.lock;

import org.springframework.boot.autoconfigure.AutoConfigurationPackage;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.ComponentScan;

/**
* 分布式锁
* @author xxm
* @date 2022/5/6
*/
@AutoConfigurationPackage
@ComponentScan
@ConfigurationPropertiesScan
public class LockCommonAutoConfiguration {
}

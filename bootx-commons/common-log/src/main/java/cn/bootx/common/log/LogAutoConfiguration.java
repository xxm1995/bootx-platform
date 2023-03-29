package cn.bootx.common.log;

import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.ComponentScan;

/**
 * 日志扫描
 *
 * @author xxm
 * @date 2022/6/6
 */
@ComponentScan
@ConfigurationPropertiesScan
@AutoConfiguration
public class LogAutoConfiguration {

}

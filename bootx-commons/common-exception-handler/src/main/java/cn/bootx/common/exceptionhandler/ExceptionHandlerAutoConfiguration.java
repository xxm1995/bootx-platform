package cn.bootx.common.exceptionhandler;

import org.springframework.boot.autoconfigure.AutoConfigurationPackage;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.ComponentScan;

/**
 * 异常处理程序
 * @author xxm
 * @date 2022/12/18
 */
@ComponentScan
@ConfigurationPropertiesScan
@AutoConfigurationPackage
public class ExceptionHandlerAutoConfiguration {
}

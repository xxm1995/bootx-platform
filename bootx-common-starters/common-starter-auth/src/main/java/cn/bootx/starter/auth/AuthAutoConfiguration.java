package cn.bootx.starter.auth;

import org.springframework.boot.autoconfigure.AutoConfigurationPackage;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.ComponentScan;

/**
* 认证相关
* @author xxm
* @date 2022/1/27
*/
@ComponentScan
@ConfigurationPropertiesScan
@AutoConfigurationPackage
public class AuthAutoConfiguration {
}

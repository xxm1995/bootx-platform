package cn.bootx.starter.wecom;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.AutoConfigurationPackage;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.ComponentScan;

/**   
* 企业微信
* @author xxm  
* @date 2022/7/22 
*/
@ComponentScan
@ConfigurationPropertiesScan
@AutoConfigurationPackage
@MapperScan
public class WeComAutoConfiguration {
}

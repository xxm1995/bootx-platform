package cn.bootx.platform.starter.dingtalk;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.ComponentScan;

/**
 * 钉钉对接
 *
 * @author xxm
 * @date 2022/4/2
 */
@ComponentScan
@ConfigurationPropertiesScan
@AutoConfiguration
@MapperScan(annotationClass = Mapper.class)
public class DingTalkAutoConfiguration {

}

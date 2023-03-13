package cn.bootx.common.actable;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.ComponentScan;

/**
 * Actable 自动根据创建表
 *
 * @author xxm
 * @date 2022/12/18
 */
@ComponentScan
@ConfigurationPropertiesScan
@AutoConfiguration
@MapperScan(annotationClass = Mapper.class)
public class ActableAutoConfiguration {

}

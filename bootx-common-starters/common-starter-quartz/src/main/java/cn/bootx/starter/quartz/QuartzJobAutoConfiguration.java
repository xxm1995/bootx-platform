package cn.bootx.starter.quartz;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.AutoConfigurationPackage;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.ComponentScan;

/**   
* 定时任务
* @author xxm  
* @date 2021/11/2 
*/
@ComponentScan
@ConfigurationPropertiesScan
@AutoConfigurationPackage
@MapperScan(annotationClass = Mapper.class)
public class QuartzJobAutoConfiguration {
}

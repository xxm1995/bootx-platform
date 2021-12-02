package cn.bootx.starter.audit.log;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

/**   
*
* @author xxm  
* @date 2021/11/8 
*/
@ComponentScan
@ConfigurationPropertiesScan
@EnableMongoRepositories
@MapperScan(annotationClass = Mapper.class)
public class AuditLogApplication {
}

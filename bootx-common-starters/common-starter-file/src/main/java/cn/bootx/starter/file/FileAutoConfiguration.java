package cn.bootx.starter.file;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

/**   
* 文件管理
* @author xxm  
* @date 2022/1/12 
*/
@ComponentScan
@ConfigurationPropertiesScan
@EnableMongoRepositories
@AutoConfiguration
@MapperScan(annotationClass = Mapper.class)
public class FileAutoConfiguration {
}

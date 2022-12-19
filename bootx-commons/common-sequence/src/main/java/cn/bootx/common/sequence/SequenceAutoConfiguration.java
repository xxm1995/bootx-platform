package cn.bootx.common.sequence;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

/**   
* sequence序列生成器
* @author xxm  
* @date 2021/12/14 
*/
@ComponentScan
@AutoConfiguration
@MapperScan(annotationClass = Mapper.class)
public class SequenceAutoConfiguration {
}

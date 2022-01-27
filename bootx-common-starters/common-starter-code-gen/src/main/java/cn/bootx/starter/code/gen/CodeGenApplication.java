package cn.bootx.starter.code.gen;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;

/**   
* 代码生成
* @author xxm  
* @date 2022/1/27 
*/
@ComponentScan
@MapperScan(annotationClass = Mapper.class)
public class CodeGenApplication {
}

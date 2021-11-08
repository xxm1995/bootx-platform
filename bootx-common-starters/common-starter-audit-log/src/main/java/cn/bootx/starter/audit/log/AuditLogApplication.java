package cn.bootx.starter.audit.log;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;

/**   
*
* @author xxm  
* @date 2021/11/8 
*/
@ComponentScan
@MapperScan(annotationClass = Mapper.class)
public class AuditLogApplication {
}

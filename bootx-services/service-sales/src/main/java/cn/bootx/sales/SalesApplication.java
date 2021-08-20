package cn.bootx.sales;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;

/**   
* 销售中心
* @author xxm  
* @date 2021/8/10 
*/
@ComponentScan
@MapperScan(annotationClass = Mapper.class)
public class SalesApplication {
}

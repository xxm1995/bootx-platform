package cn.bootx.order;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;

/**   
* 订单中心
* @author xxm  
* @date 2021/8/11 
*/
@ComponentScan
@MapperScan(annotationClass = Mapper.class)
public class OrderApplication {
}

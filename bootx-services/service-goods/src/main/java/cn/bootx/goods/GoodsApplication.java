package cn.bootx.goods;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;

/**   
* 商品中心
* @author xxm  
* @date 2021/7/27 
*/
@ComponentScan
@MapperScan(annotationClass = Mapper.class)
public class GoodsApplication {
}

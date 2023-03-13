package cn.bootx.common.query;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;

/**
 * 高级查询器
 *
 * @author xxm
 * @date 2021/11/17
 */
@ComponentScan
@MapperScan(annotationClass = Mapper.class)
public class QueryApplication {

}

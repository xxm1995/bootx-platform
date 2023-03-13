package cn.bootx.baseapi;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;

/**
 * 基础功能
 *
 * @author xxm
 * @date 2021/8/4
 */
@ComponentScan
@MapperScan(annotationClass = Mapper.class)
public class BaseApiApplication {

}

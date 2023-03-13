package cn.bootx.office;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;

/**
 * 办公服务
 *
 * @author xxm
 * @date 2022/8/23
 */
@ComponentScan
@MapperScan(annotationClass = Mapper.class)
public class OfficeApplication {

}

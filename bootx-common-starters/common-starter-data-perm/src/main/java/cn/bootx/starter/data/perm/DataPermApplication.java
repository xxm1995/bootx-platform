package cn.bootx.starter.data.perm;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;

/**
* 数据权限
* @author xxm
* @date 2021/11/23
*/
@ComponentScan
@MapperScan(annotationClass = Mapper.class)
public class DataPermApplication {
}

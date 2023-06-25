package cn.bootx.platform.demo;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;

/**
 * 演示
 *
 * @author xxm
 * @since 2021/8/6
 */
// 以这个类为 basePackageClasses
@MapperScan(annotationClass = Mapper.class) // 扫描Mybatis 的 mapper
@ComponentScan // 扫描Spring组件
public class DemoApplication {

}

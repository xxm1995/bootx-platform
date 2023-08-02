package cn.bootx.platform.miniapp;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;

/**
 * 微信小程序
 * @author xxm
 * @since 2023/8/2
 */
@ComponentScan
@MapperScan(annotationClass = Mapper.class)
public class MiniAppApplication {
}

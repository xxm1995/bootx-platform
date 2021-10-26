package cn.bootx.platform.social;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;

/**
* 三方系统(微信/钉钉/企业微信)
* @author xxm
* @date 2021/7/29
*/
@ComponentScan
@MapperScan(annotationClass = Mapper.class)
public class SocialApplication {
}

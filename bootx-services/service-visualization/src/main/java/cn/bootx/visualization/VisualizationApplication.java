package cn.bootx.visualization;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.ComponentScan;

/**
 * 可视化模块
 * @author xxm
 * @date 2023/2/16
 */
@ComponentScan
@ConfigurationPropertiesScan
@MapperScan(annotationClass = Mapper.class)
public class VisualizationApplication {
}

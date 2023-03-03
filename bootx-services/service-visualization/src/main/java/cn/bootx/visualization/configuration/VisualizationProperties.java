package cn.bootx.visualization.configuration;

import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 *
 * @author xxm
 * @date 2023/3/2
 */
@Data
@Accessors(chain = true)
@ConfigurationProperties(prefix = "bootx.service.visualization")
public class VisualizationProperties {
    /** GoView大屏服务地址 */
    private String goViewUrl = "http://localhost:6000";
}

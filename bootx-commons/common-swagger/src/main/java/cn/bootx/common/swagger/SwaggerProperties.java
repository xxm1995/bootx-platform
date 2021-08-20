package cn.bootx.common.swagger;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.LinkedHashMap;
import java.util.Map;

/**
* swagger配置
* @author xxm
* @date 2020/4/9 13:36
*/
@Getter
@Setter
@ConfigurationProperties(prefix = "bootx.common.swagger")
public class SwaggerProperties {

    /**
     * 是否开启
     */
    private boolean enabled;
    /**
     * 扫描路径, key 模块名, value 扫描路径
     */
    private Map<String, String> basePackages = new LinkedHashMap<>();
    /**
     * 标题
     */
    private String title;
    /**
     * 描述
     */
    private String description;
    /**
     * 服务条款网址
     */
    private String termsOfServiceUrl;
    /**
     * 版本号
     */
    private String version;

}

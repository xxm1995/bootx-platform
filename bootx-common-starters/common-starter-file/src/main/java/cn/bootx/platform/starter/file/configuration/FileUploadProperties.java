package cn.bootx.platform.starter.file.configuration;

import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * 文件上传配置
 *
 * @author xxm
 * @since 2022/1/14
 */
@Data
@Accessors(chain = true)
@ConfigurationProperties(prefix = "bootx.starter.file-upload")
public class FileUploadProperties {

    /**
     * 文件服务器地址, 需要与 x.file.storage 配置的 domain 一致
     */
    private String serverUrl = "http://127.0.0.1:9999";

}

package cn.bootx.starter.file.configuration;

import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
* 文件上传配置
* @author xxm
* @date 2022/1/14
*/
@Data
@Accessors(chain = true)
@ConfigurationProperties(prefix = "bootx.starter.file-upload")
public class FileUploadProperties {
    /** 上传文件类型 */
    private int uploadType = 1;

    /** 图片服务器地址 */
    private String serverUrl;

    /** 本地存储路径 */
    private String localPath = "/data/file/";
}

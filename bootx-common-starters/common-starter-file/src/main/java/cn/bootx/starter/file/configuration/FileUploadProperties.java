package cn.bootx.starter.file.configuration;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
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

    /**
     * 上传文件类型
     * @see cn.bootx.starter.file.code.FileUploadTypeCode
     */
    private int uploadType = 1;

    /** 服务器地址,优先级低于系统参数配置 */
    private String serverUrl;

    /** 本地存储 */
    private Local local = new Local();

    /** mongo存储配置 */
    private Mongo mongo = new Mongo();

    /**
     * 本地存储
     */
    @Getter
    @Setter
    public static class Local{
        /** 本地存储路径 */
        private String localPath = "/data/file/";
    }

    /**
     * mongo存储
     */
    @Getter
    @Setter
    public static class Mongo{
        /** 存储桶 */
        private String bucket = "fs";
    }
}

package cn.bootx.platform.visualization.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 文件上传oss信息
 *
 * @author xxm
 * @since 2023/2/21
 */
@Data
@Accessors(chain = true)
@Schema(title = "文件上传oss信息")
public class OssInfo {

    private String bucketName;

    /** bucket 文件访预览地址 */
    private String bucketURL;

}

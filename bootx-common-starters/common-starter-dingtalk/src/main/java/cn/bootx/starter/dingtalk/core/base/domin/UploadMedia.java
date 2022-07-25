package cn.bootx.starter.dingtalk.core.base.domin;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.InputStream;

/**   
 * 钉钉文件上传
 * @author xxm  
 * @date 2022/7/24 
 */
@Data
@Accessors(chain = true)
@Schema(title = "钉钉文件上传")
public class UploadMedia {

    @Schema(description = "媒体类型")
    private String mediaType;

    @Schema(description = "文件类型")
    private String fileType;

    @Schema(description = "文件流")
    private InputStream inputStream;
}

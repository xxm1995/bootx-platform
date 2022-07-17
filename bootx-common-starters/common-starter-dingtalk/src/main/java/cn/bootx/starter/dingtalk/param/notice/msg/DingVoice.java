package cn.bootx.starter.dingtalk.param.notice.msg;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**   
* 钉钉语音
* @author xxm  
* @date 2022/7/17
*/
@Data
@Accessors(chain = true)
@Schema(title = "")
@NoArgsConstructor
@AllArgsConstructor
public class DingVoice {

    @JsonProperty("media_id")
    @Schema(description = "媒体文件id")
    private String mediaId;

    @JsonProperty("duration")
    @Schema(description = "音频时长")
    private String duration;
}

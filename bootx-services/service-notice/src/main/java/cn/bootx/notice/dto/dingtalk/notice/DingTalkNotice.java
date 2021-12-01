package cn.bootx.notice.dto.dingtalk.notice;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**   
* 钉钉消息
* @author xxm  
* @date 2020/11/30 
*/
@Data
@Accessors(chain = true)
@NoArgsConstructor
@Schema(title = "钉钉消息基础类")
public class DingTalkNotice implements Serializable {

    private static final long serialVersionUID = -8548175773944126488L;
    @Schema(description= "@谁")
    private DingTalkAt at;

    @JsonProperty("msgtype")
    @Schema(description= "消息类型")
    private String msgType;

    public DingTalkNotice(DingTalkAt at, String msgType) {
        this.at = at;
        this.msgType = msgType;
    }

    public DingTalkNotice(String msgType) {
        this.msgType = msgType;
    }
}

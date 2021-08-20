package cn.bootx.notice.dto.dingtalk.notice;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel("钉钉消息基础类")
public class DingTalkNotice implements Serializable {

    private static final long serialVersionUID = -8548175773944126488L;
    @ApiModelProperty("@谁")
    private DingTalkAt at;

    @JsonProperty("msgtype")
    @ApiModelProperty("消息类型")
    private String msgType;

    public DingTalkNotice(DingTalkAt at, String msgType) {
        this.at = at;
        this.msgType = msgType;
    }

    public DingTalkNotice(String msgType) {
        this.msgType = msgType;
    }
}

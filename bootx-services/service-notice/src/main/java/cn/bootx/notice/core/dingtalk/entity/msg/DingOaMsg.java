package cn.bootx.notice.core.dingtalk.entity.msg;

import cn.bootx.starter.dingtalk.param.notice.msg.Msg;
import cn.bootx.starter.dingtalk.param.notice.msg.OaMsg;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import static cn.bootx.starter.dingtalk.param.notice.msg.OaMsg.*;
import static cn.bootx.starter.dingtalk.param.notice.msg.OaMsg.Oa.*;

/**   
*
* @author xxm  
* @date 2022/7/19
*/
@Data
@Accessors(chain = true)
@Schema(title = "钉钉OA消息")
public class DingOaMsg implements DingMsg {

    @JsonProperty("message_url")
    @Schema(description = "消息点击链接地址")
    private String messageUrl;

    @JsonProperty("pc_message_url")
    @Schema(description = "PC端点击消息时跳转到的地址")
    private String pcMessageUrl;

    @Schema(description = "消息头部内容")
    private Head head;

    @Schema(description = "消息体")
    private Body body;

    @JsonProperty("status_bar")
    @Schema(description = "消息状态栏")
    private StatusBar statusBar;

    /**
     * 转换成钉钉消息
     */
    @Override
    public Msg toDingMsg() {
        Oa oa = new Oa()
                .setMessageUrl(messageUrl)
                .setPcMessageUrl(pcMessageUrl)
                .setHead(head)
                .setBody(body)
                .setStatusBar(statusBar);

        return new OaMsg(oa);
    }
}

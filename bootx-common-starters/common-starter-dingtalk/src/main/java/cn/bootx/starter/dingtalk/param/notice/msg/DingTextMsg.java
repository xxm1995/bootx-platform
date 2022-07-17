package cn.bootx.starter.dingtalk.param.notice.msg;

import cn.bootx.starter.dingtalk.code.DingTalkNoticeCode;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/11/29
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "钉钉文本消息")
public class DingTextMsg extends DingMsg implements Serializable {
    private static final long serialVersionUID = 8237431306046852539L;

    @Schema(description= "文本消息体")
    private DingText text;

    public DingTextMsg() {
        super(DingTalkNoticeCode.MSG_TEXT);
    }
    public DingTextMsg(String msg) {
        super(DingTalkNoticeCode.MSG_TEXT);
        text = new DingText(msg);
    }
}

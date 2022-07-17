package cn.bootx.starter.dingtalk.param.notice.msg;

import cn.bootx.starter.dingtalk.code.DingTalkNoticeCode;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 钉钉链接通知
* @author xxm
* @date 2020/11/30
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "钉钉")
public class DingLinkMsg extends DingMsg implements Serializable {
    private static final long serialVersionUID = -3094638065840434973L;

    @Schema(description= "钉钉link消息体")
    private DingLink link;

    public DingLinkMsg() {
        super(DingTalkNoticeCode.MSG_LINK);
    }

    public DingLinkMsg(String title, String msg, String messageUrl) {
        super(DingTalkNoticeCode.MSG_LINK);
        link = new DingLink(title,msg,messageUrl);
    }
    public DingLinkMsg(String title, String msg, String messageUrl, String picUrl){
        super(DingTalkNoticeCode.MSG_LINK);
        link = new DingLink(title,msg,messageUrl,picUrl);
    }
}

package cn.bootx.starter.dingtalk.param.notice;

import cn.bootx.starter.dingtalk.code.DingTalkNoticeCode;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

;

/**
* @author xxm
* @date 2020/11/30
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "钉钉")
@NoArgsConstructor
public class DingTalkLinkNotice extends DingTalkNotice implements Serializable {
    private static final long serialVersionUID = -3094638065840434973L;

    @Schema(description= "钉钉link消息体")
    private DingTalkLink link;

    public DingTalkLinkNotice(String title,String msg,String messageUrl) {
        super(DingTalkNoticeCode.MSG_LINK);
        link = new DingTalkLink(title,msg,messageUrl);
    }
    public DingTalkLinkNotice(String title,String msg,String messageUrl,String picUrl){
        super(DingTalkNoticeCode.MSG_LINK);
        link = new DingTalkLink(title,msg,messageUrl,picUrl);
    }
}

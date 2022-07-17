package cn.bootx.starter.dingtalk.param.notice.msg;

import cn.bootx.starter.dingtalk.code.DingTalkNoticeCode;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 钉钉语音消息
 * @author xxm
 * @date 2022/7/17
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "钉钉语音消息")
public class DingVoiceMsg extends DingMsg implements Serializable {

    @Schema(description = "钉钉语音")
    private DingVoice voice;

    public DingVoiceMsg(){
        super(DingTalkNoticeCode.MSG_VOICE);
    }
    public DingVoiceMsg(String mediaId, String duration) {
        super(DingTalkNoticeCode.MSG_VOICE);
        this.voice = new DingVoice(mediaId,duration);
    }

}

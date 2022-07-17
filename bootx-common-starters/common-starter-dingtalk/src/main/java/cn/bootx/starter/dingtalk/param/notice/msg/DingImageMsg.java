package cn.bootx.starter.dingtalk.param.notice.msg;

import cn.bootx.starter.dingtalk.code.DingTalkNoticeCode;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**   
* 钉钉图片通知
* @author xxm  
* @date 2022/7/17 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "钉钉图片通知")
public class DingImageMsg extends DingMsg implements Serializable {
    private static final long serialVersionUID = -835679566138176L;

    @Schema(description = "钉钉图片")
    private DingImage image;

    public DingImageMsg() {
        super(DingTalkNoticeCode.MSG_IMAGE);
    }

    public DingImageMsg(String mediaId){
        super(DingTalkNoticeCode.MSG_IMAGE);
        this.image = new DingImage(mediaId);
    }

}

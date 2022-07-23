package cn.bootx.notice.core.wecom.entity.msg;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;
import me.chanjar.weixin.cp.bean.message.WxCpMessage;

/**   
*
* @author xxm  
* @date 2022/7/23 
*/
@Data
@Accessors(chain = true)
@Schema(title = "企微图片消息")
public class WeComImageMsg implements WeComMsg{

    @Schema(description = "资源id")
    private String mediaId;

    @Override
    public WxCpMessage toMsg() {
        return WxCpMessage.IMAGE()
                .mediaId(mediaId)
                .build();
    }
}

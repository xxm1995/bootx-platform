package cn.bootx.starter.dingtalk.param.notice;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

;

/**   
* 钉钉文本消息
* @author xxm  
* @date 2020/11/29 
*/
@Data
@Accessors(chain = true)
@NoArgsConstructor
@Schema(title = "钉钉文本")
public class DingTalkText implements Serializable {

    private static final long serialVersionUID = 3582073816491238620L;
    @Schema(description= "文本")
    private String content;

    public DingTalkText(String content){
        this.content = content;
    }
}

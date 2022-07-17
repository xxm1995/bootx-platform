package cn.bootx.starter.dingtalk.param.notice.msg;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
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
@AllArgsConstructor
@Schema(title = "钉钉文本")
public class DingText implements Serializable {

    private static final long serialVersionUID = 3582073816491238620L;
    @Schema(description= "文本")
    private String content;

}

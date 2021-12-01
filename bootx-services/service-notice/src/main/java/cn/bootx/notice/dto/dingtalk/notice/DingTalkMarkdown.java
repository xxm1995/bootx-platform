package cn.bootx.notice.dto.dingtalk.notice;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**   
* 钉钉markdown格式信息
* @author xxm  
* @date 2020/11/30 
*/
@Data
@Accessors(chain = true)
@NoArgsConstructor
@Schema(title = "钉钉文本消息")
public class DingTalkMarkdown implements Serializable {
    private static final long serialVersionUID = 2353543901449818541L;
    @Schema(name = "标题")
    private String title;

    @Schema(name = "内容")
    private String text;

    public DingTalkMarkdown(String title, String text) {
        this.title = title;
        this.text = text;
    }
}

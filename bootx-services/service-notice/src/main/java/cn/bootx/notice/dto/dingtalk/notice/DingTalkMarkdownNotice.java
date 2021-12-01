package cn.bootx.notice.dto.dingtalk.notice;

import cn.bootx.notice.code.DingTalkCode;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**   
* 钉钉markdown消息
* @author xxm  
* @date 2020/11/30 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@NoArgsConstructor
@Schema(title = "钉钉文本消息")
public class DingTalkMarkdownNotice extends DingTalkNotice implements Serializable {

    private static final long serialVersionUID = -2724590259000709240L;
    @Schema(description= "markdown消息体")
    private DingTalkMarkdown markdown;

    /**
     * @param title 标题
     * @param msg 内容
     * @param phones 发送给谁
     */
	public DingTalkMarkdownNotice(String title, String msg, List<String> phones) {
		super(new DingTalkAt(phones), DingTalkCode.MSG_MARKDOWN);
        markdown = new DingTalkMarkdown(title, msg + super.getAt().toAt());
	}

	public DingTalkMarkdownNotice(String title, String msg){
        super(DingTalkCode.MSG_MARKDOWN);
        markdown = new DingTalkMarkdown(title, msg);
    }

}

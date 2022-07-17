package cn.bootx.starter.dingtalk.param.notice.msg;

import cn.bootx.starter.dingtalk.code.DingTalkNoticeCode;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

;

/**   
* 钉钉markdown消息
* @author xxm  
* @date 2020/11/30 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "钉钉文本消息")
public class DingMarkdownMsg extends DingMsg implements Serializable {
    private static final long serialVersionUID = -2724590259000709240L;

    @Schema(description= "markdown消息体")
    private DingMarkdown markdown;

    public DingMarkdownMsg() {
        super(DingTalkNoticeCode.MSG_MARKDOWN);
    }

    /**
     * @param title 标题
     * @param msg 内容
     * @param phones @谁
     */
	public DingMarkdownMsg(String title, String msg, List<String> phones) {
		super(new DingAt(phones), DingTalkNoticeCode.MSG_MARKDOWN);
        this.markdown = new DingMarkdown(title, msg + super.getAt().toAt());
	}

	public DingMarkdownMsg(String title, String msg){
        super(DingTalkNoticeCode.MSG_MARKDOWN);
        this.markdown = new DingMarkdown(title, msg);
    }

}

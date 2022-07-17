package cn.bootx.starter.dingtalk.param.notice.msg;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

;

/**
* @author xxm
* @date 2020/11/30
*/
@Data
@Accessors(chain = true)
@Schema(title = "钉钉link")
@NoArgsConstructor
public class DingLink implements Serializable {
    private static final long serialVersionUID = 8191181631664337904L;

    @Schema(description= "标题")
    private String title;

    @Schema(description= "内容")
    private String text;

    @Schema(description= "点击消息跳转的URL")
    private String messageUrl;

    @Schema(description= "图片URL")
    private String picUrl;

    public DingLink(String title, String text, String messageUrl) {
        this.title = title;
        this.text = text;
        this.messageUrl = messageUrl;
    }

    public DingLink(String title, String text, String messageUrl, String picUrl) {
        this.title = title;
        this.text = text;
        this.messageUrl = messageUrl;
        this.picUrl = picUrl;
    }
}

package cn.bootx.notice.dto.dingtalk.notice;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/11/30
*/
@Data
@Accessors(chain = true)
@ApiModel("钉钉link")
@NoArgsConstructor
public class DingTalkLink implements Serializable {
    private static final long serialVersionUID = 8191181631664337904L;

    @ApiModelProperty("标题")
    private String title;

    @ApiModelProperty("内容")
    private String text;

    @ApiModelProperty("点击消息跳转的URL")
    private String messageUrl;

    @ApiModelProperty("图片URL")
    private String picUrl;

    public DingTalkLink(String title, String text, String messageUrl) {
        this.title = title;
        this.text = text;
        this.messageUrl = messageUrl;
    }

    public DingTalkLink(String title, String text, String messageUrl, String picUrl) {
        this.title = title;
        this.text = text;
        this.messageUrl = messageUrl;
        this.picUrl = picUrl;
    }
}

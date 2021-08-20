package cn.bootx.notice.param.site;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
* 站内信
* @author xxm
* @date 2021/8/7
*/
@Data
@Accessors(chain = true)
@ApiModel("站内信")
public class SiteMessageParam {

    @ApiModelProperty("主键")
    private Long id;

    /**消息标题*/
    private String title;

    /**消息内容*/
    private String content;

    /**发送者id*/
    private Long senderId;

    /**发送者姓名*/
    private String senderName;

    /**接收者id*/
    private Long receiveId;

    /**接收者姓名*/
    private String receiveName;

    /**发送时间*/
    private LocalDateTime senderTime;

    /** 已读 */
    private Boolean haveRead;

    /** 已读时间 */
    private LocalDateTime readTime;
}

package cn.bootx.notice.dto.site;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
* 站内信
* @author xxm
* @date 2021/8/7
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel("站内信")
public class SiteMessageDto extends BaseDto {

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

package cn.bootx.notice.dto.site;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
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
@Schema(title = "站内信")
public class SiteMessageDto extends BaseDto {

    @Schema(description= "消息标题")
    private String title;

    @Schema(description= "消息内容")
    private String content;

    @Schema(description= "发送者id")
    private Long senderId;

    @Schema(description= "发送者姓名")
    private String senderName;

    @Schema(description= "接收者id")
    private Long receiveId;

    @Schema(description= "接收者姓名")
    private String receiveName;

    @Schema(description= "发送时间")
    private LocalDateTime senderTime;

    @Schema(description= "已读")
    private Boolean haveRead;

    @Schema(description= "已读时间")
    private LocalDateTime readTime;
}

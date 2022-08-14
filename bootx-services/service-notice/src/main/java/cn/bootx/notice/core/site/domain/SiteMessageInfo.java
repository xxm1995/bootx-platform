package cn.bootx.notice.core.site.domain;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;
import lombok.experimental.FieldNameConstants;

import java.time.LocalDateTime;

/**
 * 站内信信息详情
 * @author xxm
 * @date 2022/8/14 
 */
@Data
@Accessors(chain = true)
@FieldNameConstants
@Schema(title = "站内信信息详情")
public class SiteMessageInfo {
    private Long id;
    private String title;
    private Long senderId;
    private String senderName;
    private String receiveType;
    private LocalDateTime senderTime;
    private String sendState;
    private LocalDateTime cancelTime;
    private Long receiveId;
    private Boolean haveRead;
    private LocalDateTime readTime;
}

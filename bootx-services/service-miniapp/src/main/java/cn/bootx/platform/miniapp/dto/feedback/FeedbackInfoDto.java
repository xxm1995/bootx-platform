package cn.bootx.platform.miniapp.dto.feedback;

import cn.bootx.platform.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 用户反馈信息
 * @author xxm
 * @since 2023-08-15
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(title = "用户反馈信息")
@Accessors(chain = true)
public class FeedbackInfoDto extends BaseDto {

    @Schema(description = "问题分类")
    private String classify;
    @Schema(description = "时间")
    private LocalDateTime time;
    @Schema(description = "联系方式")
    private String contact;
    @Schema(description = "姓名")
    private String name;
    @Schema(description = "反馈用户ID")
    private Long userId;
    @Schema(description = "内容")
    private String content;

}

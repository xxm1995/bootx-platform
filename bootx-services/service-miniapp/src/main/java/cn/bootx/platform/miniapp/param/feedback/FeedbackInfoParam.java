package cn.bootx.platform.miniapp.param.feedback;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;
import org.hibernate.validator.constraints.Length;

import java.time.LocalDateTime;

/**
 * 用户反馈信息
 * @author xxm
 * @since 2023-08-15
 */
@Data
@Schema(title = "用户反馈信息")
@Accessors(chain = true)
public class FeedbackInfoParam {

    @Schema(description= "主键")
    private Long id;

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
    @Length(max = 200,min = 1,message = "反馈内容长度应处于1到1000之间")
    @Schema(description = "内容")
    private String content;

}

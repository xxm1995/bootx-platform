package cn.bootx.demo.core.notice.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;

/**
 * 简单邮件发送参数
 *
 * @author xxm
 * @date 2022/8/3
 */
@Data
@Accessors(chain = true)
@Schema(title = "简单邮件发送参数")
public class SendSimpleEmailDemoParam {

    @Schema(description = "标题")
    @NotNull(message = "主题不能为空")
    private String subject;

    @Schema(description = "邮箱地址")
    @NotNull(message = "邮箱地址不能为空")
    private String email;

    @Schema(description = "消息")
    @NotNull(message = "消息不能为空")
    private String message;

}

package cn.bootx.notice.dto.mail;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "邮件模板")
public class MailTemplateDto extends BaseDto {

    @Schema(name = "编码")
    private String code;

    @Schema(name = "名称")
    private String name;

    @Schema(name = "内容")
    private String date;

    @Schema(name = "路径")
    private String path;

    @Schema(name = "类型")
    private Integer type;

}

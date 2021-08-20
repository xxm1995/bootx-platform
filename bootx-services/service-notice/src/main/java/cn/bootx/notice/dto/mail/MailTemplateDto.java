package cn.bootx.notice.dto.mail;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel("邮件模板")
public class MailTemplateDto extends BaseDto {

    @ApiModelProperty("编码")
    private String code;

    @ApiModelProperty("名称")
    private String name;

    @ApiModelProperty("内容")
    private String date;

    @ApiModelProperty("路径")
    private String path;

    @ApiModelProperty("类型")
    private Integer type;

}

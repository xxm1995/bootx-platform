package cn.bootx.notice.param.mail;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**   
* 邮件模板
* @author xxm  
* @date 2021/8/5 
*/
@Data
@Accessors(chain = true)
@ApiModel("邮件模板")
public class MailTemplateParam {

    @ApiModelProperty("主键")
    private Long id;

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

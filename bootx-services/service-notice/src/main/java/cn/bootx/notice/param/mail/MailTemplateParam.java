package cn.bootx.notice.param.mail;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

/**   
* 邮件模板
* @author xxm  
* @date 2021/8/5 
*/
@Data
@Accessors(chain = true)
@Schema(title = "邮件模板")
public class MailTemplateParam {

    @Schema(name = "主键")
    private Long id;

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

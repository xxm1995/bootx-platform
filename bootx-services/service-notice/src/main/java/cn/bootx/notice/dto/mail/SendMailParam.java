package cn.bootx.notice.dto.mail;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.List;

/**   
* 发邮件的参数
* @author xxm  
* @date 2020/5/2 20:31
*/
@ApiModel(value = "发邮件的参数")
@Data
@Accessors(chain = true)
public class SendMailParam implements Serializable {

    private static final long serialVersionUID = 7472189938984313186L;

    @ApiModelProperty("配置编号")
    private String configCode;

    @ApiModelProperty("标题")
    @NotNull(message = "主题不能为空")
    private String subject;

    @ApiModelProperty("消息")
    @NotNull(message = "消息不能为空")
    private String message;

    @ApiModelProperty("接收人")
    @NotNull(message = "to 不能为空")
    private List<String> to;

    @ApiModelProperty("抄送")
    private List<String> ccList;

    @ApiModelProperty("密送")
    private List<String> bccList;

    @ApiModelProperty("是否单条发送(拆分收件人)  默认true")
    private Boolean singleSend = true;

    @ApiModelProperty("是否包含附件")
    private boolean sendAttachment;

    @ApiModelProperty("附件列表")
    private List<MailFileParam> fileList;
}

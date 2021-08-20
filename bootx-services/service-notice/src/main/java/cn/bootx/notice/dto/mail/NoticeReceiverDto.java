package cn.bootx.notice.dto.mail;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
* 测试通知接收者管理
* @author xxm  
* @date 2020/5/3 10:56 
*/
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "通知接收者配置dto")
@Data
@Accessors(chain = true)
public class NoticeReceiverDto extends BaseDto {
    /**
     * 通知类型常量
     */
    public static final int NOTICE_TYPE_PHONE = 1;
    public static final int NOTICE_TYPE_EMAIL = 2;
    public static final int NOTICE_TYPE_WECHAT = 3;

    @ApiModelProperty(name = "type", value = "联系方式类型，（1：电话，2：邮件，3：微信）")
    @NotNull
    private Integer type;

    @ApiModelProperty(name = "value", value = "联系方式")
    @NotNull
    @Size(max = 255, message = "value max length is 255")
    private String value;
}

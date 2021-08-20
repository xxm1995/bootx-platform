package cn.bootx.notice.param.template;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2021/8/10
*/
@Data
@Accessors(chain = true)
@ApiModel("消息模板")
public class MessageTemplateParam implements Serializable {

    private static final long serialVersionUID = 593034193370220643L;
    @ApiModelProperty("主键")
    private Long id;

    /**
     * 编码
     */
    private String code;

    /**
     * 名称
     */
    private String name;

    /**
     * 内容
     */
    private String date;

    /**
     * 备注
     */
    private String remark;

    /**
     * 模板类型
     * @see cn.bootx.notice.code.MessageTemplateCode
     */
    private Integer type;

}

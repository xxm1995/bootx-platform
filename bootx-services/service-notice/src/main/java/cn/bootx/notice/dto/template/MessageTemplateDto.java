package cn.bootx.notice.dto.template;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* 消息模板
* @author xxm
* @date 2021/8/10
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel("消息模板")
public class MessageTemplateDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = -1377790220501836009L;

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

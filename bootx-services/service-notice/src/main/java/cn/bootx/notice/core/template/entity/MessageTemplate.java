package cn.bootx.notice.core.template.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.notice.code.MessageTemplateCode;
import cn.bootx.notice.core.template.convert.MessageTemplateConvert;
import cn.bootx.notice.dto.template.MessageTemplateDto;
import cn.bootx.notice.param.template.MessageTemplateParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@EqualsAndHashCode(callSuper = true)
@Data
@TableName("nc_message_template")
@Accessors(chain = true)
public class MessageTemplate extends MpBaseEntity implements EntityBaseFunction<MessageTemplateDto> {

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
     * @see MessageTemplateCode
     */
    private Integer type;

    public static MessageTemplate init(MessageTemplateDto in) {
        return MessageTemplateConvert.CONVERT.convert(in);
    }

    public static MessageTemplate init(MessageTemplateParam in) {
        return MessageTemplateConvert.CONVERT.convert(in);
    }

    @Override
    public MessageTemplateDto toDto() {
        return MessageTemplateConvert.CONVERT.convert(this);
    }
}

package cn.bootx.platform.notice.core.sms.entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalDate;
import java.time.LocalTime;

import cn.bootx.platform.common.core.function.EntityBaseFunction;
import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;

import com.baomidou.mybatisplus.annotation.TableName;
import cn.bootx.platform.notice.dto.sms.SmsTemplateDto;
import cn.bootx.platform.notice.param.sms.SmsTemplateParam;
import cn.bootx.platform.notice.core.sms.convert.SmsTemplateConvert;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 短信模板配置
* @author xxm
* @since 2023-08-03
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("notice_sms_template")
public class SmsTemplate extends MpBaseEntity implements EntityBaseFunction<SmsTemplateDto>{

    /** 短信渠道商类型 */
    private String supplierType;
    /** 短信渠道商类型 */
    private String templateId;
    /** 短信模板名称 */
    private String name;
    /** 短信模板内容 */
    private String content;

    /** 创建对象 */
    public static SmsTemplate init(SmsTemplateParam in) {
            return SmsTemplateConvert.CONVERT.convert(in);
    }

    /** 转换成dto */
    @Override
    public SmsTemplateDto toDto() {
        return SmsTemplateConvert.CONVERT.convert(this);
    }
}

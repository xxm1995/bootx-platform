package cn.bootx.platform.notice.core.sms.entity;

import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 短信渠道配置
 * @author xxm
 * @since 2023/3/28
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("notice_sms_channel_config")
public class SmsChannelConfig extends MpBaseEntity {

    /** 渠道编码 */
    private String code;
    /** 短信签名 */
    private String signature;
    /** 短信ApiKey */
    private String apiKey;
    /** 短信Api秘钥 */
    private String apiSecret;
    /** 回调地址 */
    private String url;

}

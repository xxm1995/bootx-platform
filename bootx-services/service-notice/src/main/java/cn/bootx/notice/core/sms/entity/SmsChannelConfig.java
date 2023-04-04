package cn.bootx.notice.core.sms.entity;

import cn.bootx.common.core.annotation.actable.Column;
import cn.bootx.common.core.annotation.actable.Table;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 短信渠道配置
 * @author xxm
 * @date 2023/3/28
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("notice_sms_channel_config")
@Table(comment = "短信渠道配置")
public class SmsChannelConfig extends MpBaseEntity {

    /** 渠道编码 */
    @Column(comment = "渠道编码")
    private String code;
    /** 短信签名 */
    @Column(comment = "短信签名")
    private String signature;
    /** 短信ApiKey */
    @Column(comment = "短信ApiKey")
    private String apiKey;
    /** 短信Api秘钥 */
    @Column(comment = "短信Api秘钥")
    private String apiSecret;
    /** 回调地址 */
    @Column(comment = "回调地址")
    private String url;

}

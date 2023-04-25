package cn.bootx.notice.core.sms.entity;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.mybatis.table.modify.annotation.DbColumn;
import cn.bootx.mybatis.table.modify.annotation.DbTable;
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
@DbTable(comment = "短信渠道配置")
public class SmsChannelConfig extends MpBaseEntity {

    /** 渠道编码 */
    @DbColumn(comment = "渠道编码")
    private String code;
    /** 短信签名 */
    @DbColumn(comment = "短信签名")
    private String signature;
    /** 短信ApiKey */
    @DbColumn(comment = "短信ApiKey")
    private String apiKey;
    /** 短信Api秘钥 */
    @DbColumn(comment = "短信Api秘钥")
    private String apiSecret;
    /** 回调地址 */
    @DbColumn(comment = "回调地址")
    private String url;

}

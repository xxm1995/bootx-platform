package cn.bootx.payment.core.paymodel.wechat.entity;

import cn.bootx.common.core.annotation.EncryptionField;
import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.payment.core.paymodel.wechat.convert.WeChatConvert;
import cn.bootx.payment.dto.paymodel.wechat.WeChatPayConfigDto;
import cn.bootx.payment.param.paymodel.wechat.WeChatPayConfigParam;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.FieldStrategy;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 微信支付
 * @author xxm
 * @date 2021/3/1
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("pay_wechat_pay_config")
public class WeChatPayConfig extends MpBaseEntity implements EntityBaseFunction<WeChatPayConfigDto> {

    /** 名称 */
    private String name;
    /** 微信商户号 */
    private String mchId;
    /** 微信应用appId */
    private String appId;

    /**
     * api版本
     * @see cn.bootx.payment.code.paymodel.WeChatPayCode#API_V2
     */
    private String apiVersion;
    /** 商户平台「API安全」中的 APIv2 密钥 */
    @EncryptionField
    private String apiKeyV2;
    /** 商户平台「API安全」中的 APIv3 密钥 */
    @EncryptionField
    private String apiKeyV3;
    /** APPID对应的接口密码，用于获取接口调用凭证access_token时使用 */
    @EncryptionField
    private String appSecret;

    /** API 证书中的 p12 */
    private byte[] p12;

    /** 应用域名，回调中会使用此参数 */
    private String domain;
    /** 服务器异步通知页面路径 通知url必须为直接可访问的url，不能携带参数。公网域名必须为https  */
    private String notifyUrl;
    /** 页面跳转同步通知页面路径 */
    private String returnUrl;

    /** 是否沙箱环境 */
    private boolean sandbox;
    /** 可用支付方式 */
    @TableField(updateStrategy = FieldStrategy.IGNORED)
    private String payWays;
    /** 是否启用 */
    private Boolean activity;
    /** 状态 */
    private Integer state;
    /** 备注 */
    private String remark;

    @Override
    public WeChatPayConfigDto toDto() {
        WeChatPayConfigDto convert =  WeChatConvert.CONVERT.convert(this);
        if (StrUtil.isNotBlank(this.getPayWays())){
            convert.setPayWayList(StrUtil.split(this.getPayWays(),','));
        }
        return convert;
    }

    public static WeChatPayConfig init(WeChatPayConfigParam in){
        WeChatPayConfig convert = WeChatConvert.CONVERT.convert(in);
        if (CollUtil.isNotEmpty(in.getPayWayList())){
            convert.setPayWays(String.join(",", in.getPayWayList()));
        }
        return convert;
    }
}

package cn.bootx.payment.dto.paymodel.wechat;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
* @author xxm
* @date 2021/3/19
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "微信支付配置")
public class WeChatPayConfigDto extends BaseDto implements Serializable {

    @Schema(name = "名称")
    private String name;
    @Schema(name = "备注")
    private String remark;
    @Schema(name = "微信应用Id")
    private String appId;
    @Schema(name = "微信商户号")
    private String mchId;
    @Schema(name = "微信服务商应用编号")
    private String slAppId;
    @Schema(name = "微信服务商商户号")
    private String slMchId;
    @Schema(name = "同 apiKey 后续版本会舍弃")
    private String partnerKey;
    @Schema(name = "商户平台「API安全」中的 API 密钥")
    private String apiKey;
    @Schema(name = "商户平台「API安全」中的 APIv3 密钥")
    private String apiKey3;
    @Schema(name = "应用域名，回调中会使用此参数")
    private String domain;
    @Schema(name = "服务器异步通知页面路径")
    private String notifyUrl;
    @Schema(name = "页面跳转同步通知页面路径")
    private String returnUrl;
    @Schema(name = "API 证书中的 p12")
    private String certPath;
    @Schema(name = "API 证书中的 key.pem")
    private String keyPemPath;
    @Schema(name = "API 证书中的 cert.pem")
    private String certPemPath;
    @Schema(name = "是否沙箱环境")
    private boolean sandbox;
    @Schema(name = "可用支付方式")
    private String payTypes;
    @Schema(name = "可用支付方式")
    private List<String> payTypeList;
    @Schema(name = "是否启用")
    private Boolean activity;
    @Schema(name = "状态")
    private Integer state;
}

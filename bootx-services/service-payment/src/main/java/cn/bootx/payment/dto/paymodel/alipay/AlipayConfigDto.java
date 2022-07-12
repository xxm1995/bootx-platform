package cn.bootx.payment.dto.paymodel.alipay;

import cn.bootx.common.core.enums.SensitiveType;
import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.starter.data.perm.sensitive.SensitiveInfo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
* @author xxm
* @date 2021/2/26
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "支付宝配置")
public class AlipayConfigDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = 6641158663606363171L;

    @Schema(description = "名称")
    private String name;

    @Schema(description = "支付宝商户appId")
    @SensitiveInfo(value = SensitiveType.OTHER)
    private String appId;

    @Schema(description = "服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问")
    private String notifyUrl;

    @Schema(description = "页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址")
    private String returnUrl;

    @Schema(description = "请求网关地址")
    private String serverUrl;

    @Schema(description = "认证类型 证书/公钥")
    private Integer authType;

    @Schema(description = "签名类型")
    private String signType;

    @Schema(description = "支付宝公钥")
    @SensitiveInfo(value = SensitiveType.OTHER, front = 15)
    private String alipayPublicKey;

    @Schema(description = "私钥")
    @SensitiveInfo(value = SensitiveType.OTHER, front = 15)
    private String privateKey;

    @Schema(description = "应用公钥证书")
    @SensitiveInfo(value = SensitiveType.OTHER, front = 15)
    private String appCert;

    @Schema(description = "支付宝公钥证书文件")
    @SensitiveInfo(value = SensitiveType.OTHER, front = 15)
    private String alipayCert;

    @Schema(description = "支付宝CA根证书文件")
    @SensitiveInfo(value = SensitiveType.OTHER, front = 15)
    private String alipayRootCert;

    @Schema(description = "超时配置")
    private Integer expireTime;

    @Schema(description = "可用支付方式")
    private List<String> payWayList;

    @Schema(description = "是否沙箱环境")
    private boolean sandbox;

    @Schema(description = "是否启用")
    private Boolean activity;

    @Schema(description = "状态")
    private Integer state;

    @Schema(description = "备注")
    private String remark;
}

package cn.bootx.payment.dto.paymodel.alipay;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
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
@ApiModel("支付宝配置")
public class AlipayConfigDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = 6641158663606363171L;

    /** 名称 */
    private String name;

    /** 支付宝商户appId */
    private String appId;

    /** 服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 */
    private String notifyUrl;

    /** 页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址 */
    private String returnUrl;

    /** 请求网关地址 */
    private String serverUrl;

    /** 支付宝公钥 */
    public String alipayPublicKey;

    /** 签名类型 */
    public String signType;

    /** 私钥 */
    private String privateKey;

    /** 超时配置 */
    private String expireTime;

    /** 可用支付方式 */
    private List<String> payTypeList;

    /** 是否沙箱环境 */
    private boolean sandbox;

    /** 状态 */
    private Integer state;

    /** 备注 */
    private String remark;
}

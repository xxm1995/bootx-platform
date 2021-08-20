package cn.bootx.payment.param.paymodel.alipay;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
* @author xxm
* @date 2021/2/26
*/
@Data
@Accessors(chain = true)
@ApiModel("支付宝配置参数")
public class AlipayConfigParam implements Serializable {

    private Long id;

    /** 名称 */
    private String name;

    /** 状态 */
    private Integer state;

    /** 备注 */
    private String remark;

    /** 支付宝商户appId */
    private String appId;

    /** 服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 */
    private String notifyUrl;

    /** 页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址 */
    private String returnUrl;

    /** 请求网关地址 */
    private String url;

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
}

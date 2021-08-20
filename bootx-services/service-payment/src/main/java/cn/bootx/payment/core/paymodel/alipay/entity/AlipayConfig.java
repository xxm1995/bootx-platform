package cn.bootx.payment.core.paymodel.alipay.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.payment.core.paymodel.alipay.convert.AlipayConvert;
import cn.bootx.payment.dto.paymodel.alipay.AlipayConfigDto;
import cn.bootx.payment.param.paymodel.alipay.AlipayConfigParam;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**   
* 支付宝支付配置
* @author xxm  
* @date 2020/12/15 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("pc_alipay_config")
public class AlipayConfig extends MpBaseEntity implements EntityBaseFunction<AlipayConfigDto> {

    /** 名称 */
    private String name;

    /** 备注 */
    private String remark;

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

    /** 私钥 */
    private String privateKey;

    /** 签名类型 */
    public String signType;

    /** 是否沙箱环境 */
    private boolean sandbox;

    /** 超时配置 */
    private String expireTime;

    /** 可用支付方式 */
    private String payTypes;

    /** 是否启用 */
    private Boolean activity;

    /** 状态 */
    private Integer state;


    @Override
    public AlipayConfigDto toDto(){
        AlipayConfigDto convert = AlipayConvert.CONVERT.convert(this);
        convert.setPayTypeList(StrUtil.split(this.getPayTypes(),','));
        return convert;
    }

    public static AlipayConfig init(AlipayConfigDto in){
        AlipayConfig convert = AlipayConvert.CONVERT.convert(in);
        if (CollUtil.isNotEmpty(in.getPayTypeList())){
            convert.setPayTypes(String.join(",", in.getPayTypeList()));
        }
        return convert;
    }
    public static AlipayConfig init(AlipayConfigParam in){
        AlipayConfig convert = AlipayConvert.CONVERT.convert(in);
        if (CollUtil.isNotEmpty(in.getPayTypeList())){
            convert.setPayTypes(String.join(",", in.getPayTypeList()));
        }
        return convert;
    }

}


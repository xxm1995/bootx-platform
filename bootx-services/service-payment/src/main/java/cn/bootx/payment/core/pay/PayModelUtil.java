package cn.bootx.payment.core.pay;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.payment.code.pay.PayChannelCode;
import cn.bootx.payment.code.pay.PayChannelEnum;
import cn.bootx.payment.code.pay.PayModelExtraCode;
import cn.bootx.payment.param.pay.PayModeParam;
import cn.bootx.payment.param.pay.PayParam;
import cn.bootx.payment.param.paymodel.alipay.AliPayParam;
import cn.bootx.payment.param.paymodel.wechat.WeChatPayParam;
import cn.hutool.json.JSONUtil;
import lombok.experimental.UtilityClass;

import java.util.List;
import java.util.Map;

/**
 * 支付方式工具类
 * @author xxm
 * @date 2021/4/21
 */
@UtilityClass
public class PayModelUtil {

    /**
     * 判断是否有异步支付
     */
    public boolean isNotSync(List<PayModeParam> payModeParams){
        return payModeParams.stream()
                .map(PayModeParam::getPayChannel)
                .noneMatch(PayChannelCode.SYNC_TYPE::contains);
    }

    /**
     * 获取异步支付参数
     */
    public PayModeParam getSyncPayModeParam(PayParam payParam){
        return payParam.getPayModeList().stream()
                .filter(payMode -> PayChannelCode.SYNC_TYPE.contains(payMode.getPayChannel()))
                .findFirst()
                .orElseThrow(() -> new BizException("支付方式数据异常"));
    }

    /**
     * 构建扩展参数构建
     * @param payChannel 支付通道
     * @param map 支付方式扩展字段信息 key 为 PayModelExtraCode中定义的
     */
    public String buildExtraParamsJson(Integer payChannel, Map<String, String> map){
        PayChannelEnum payChannelEnum = PayChannelEnum.findByNo(payChannel);
        switch (payChannelEnum){
            case ALI:{
                return JSONUtil.toJsonStr(new AliPayParam()
                        .setAuthCode(map.get(PayModelExtraCode.AUTH_CODE))
                        .setReturnUrl(map.get(PayModelExtraCode.RETURN_URL)));
            }
            case WECHAT:{
                return JSONUtil.toJsonStr(new WeChatPayParam()
                        .setAuthCode(map.get(PayModelExtraCode.AUTH_CODE)));
            }
            default:{
                return null;
            }
        }
    }

}

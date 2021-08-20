package cn.bootx.payment.core.pay;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.payment.code.pay.PayChannelCode;
import cn.bootx.payment.param.pay.PayModeParam;
import cn.bootx.payment.param.pay.PayParam;
import lombok.experimental.UtilityClass;

import java.util.List;

/**
* 支付方式工具类
* @author xxm  
* @date 2021/4/21 
*/
@UtilityClass
public class PayModelUtils {

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
    public PayModeParam getSyncPayModel(PayParam payParam){
        return payParam.getPayModeList().stream()
                .filter(payMode -> PayChannelCode.SYNC_TYPE.contains(payMode.getPayChannel()))
                .findFirst()
                .orElseThrow(() -> new BizException("支付方式数据异常"));
    }

}

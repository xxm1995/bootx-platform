package cn.bootx.payment.core.pay.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.BigDecimalUtil;
import cn.bootx.payment.code.pay.PayChannelCode;
import cn.bootx.payment.exception.payment.PaymentAmountAbnormalException;
import cn.bootx.payment.param.pay.PayModeParam;
import cn.bootx.payment.param.pay.PayParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**   
* 支付时校验服务
* @author xxm  
* @date 2021/7/4 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class PayValidationService {

    /**
     * 检查支付金额
     */
    public void validationAmount(List<PayModeParam> payModeList){
        for (PayModeParam payModeParam : payModeList) {
            // 同时满足支付金额小于等于零
            if (BigDecimalUtil.compareTo(payModeParam.getAmount(), BigDecimal.ZERO) < 1){
                throw new PaymentAmountAbnormalException();
            }
        }
    }

    /**
     * 检查异步支付方式
     */
    public void validationSyncPayModel(PayParam payParam) {
        // 组合支付时只允许有一个异步支付方式
        List<PayModeParam> payModeList = payParam.getPayModeList();

        long syncPayModeCount = payModeList.stream()
                .map(PayModeParam::getPayChannel)
                .filter(PayChannelCode.SYNC_TYPE::contains)
                .count();
        if (syncPayModeCount>1){
            throw new BizException("组合支付时只允许有一个异步支付方式");
        }
    }
}

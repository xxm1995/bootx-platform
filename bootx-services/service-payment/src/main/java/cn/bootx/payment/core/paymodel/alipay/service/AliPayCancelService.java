package cn.bootx.payment.core.paymodel.alipay.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.payment.code.paymodel.AliPayCode;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.core.paymodel.alipay.entity.AlipayConfig;
import cn.hutool.json.JSONUtil;
import com.alipay.api.AlipayApiException;
import com.alipay.api.domain.AlipayTradeCancelModel;
import com.alipay.api.response.AlipayTradeCancelResponse;
import com.ijpay.alipay.AliPayApi;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * 支付宝支付取消支付
 * @author xxm
 * @date 2021/4/20
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AliPayCancelService {

    /**
     * 关闭支付
     */
    public void cancelRemote(Payment payment, AlipayConfig alipayConfig){
        // 只有部分需要调用支付宝网关进行关闭
        AlipayTradeCancelModel model = new AlipayTradeCancelModel();
        model.setOutTradeNo(String.valueOf(payment.getId()));

        try {
            AlipayTradeCancelResponse response = AliPayApi.tradeCancelToResponse(model);
            log.info(JSONUtil.toJsonStr(response));
            if (!Objects.equals(AliPayCode.SUCCESS,response.getCode())){
                log.error("网关返回撤销失败消息");
            }
        } catch (AlipayApiException e) {
            log.error("关闭订单失败:",e);
            throw new BizException("关闭订单失败");
        }
    }
}



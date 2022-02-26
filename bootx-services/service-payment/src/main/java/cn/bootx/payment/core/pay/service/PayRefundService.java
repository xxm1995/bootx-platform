package cn.bootx.payment.core.pay.service;

import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.core.pay.builder.PaymentBuilder;
import cn.bootx.payment.core.pay.factory.PayStrategyFactory;
import cn.bootx.payment.core.pay.func.AbsPayStrategy;
import cn.bootx.payment.core.pay.func.PayStrategyConsumer;
import cn.bootx.payment.core.payment.dao.PaymentManager;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.core.payment.service.PaymentService;
import cn.bootx.payment.exception.payment.PaymentUnsupportedMethodException;
import cn.bootx.payment.param.pay.PayParam;
import cn.hutool.core.collection.CollectionUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

/**   
* 支付退款
* @author xxm  
* @date 2022/2/26 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class PayRefundService {
    private final PaymentService paymentService;
    private final PaymentManager paymentManager;
    /**
     * 根据业务id取消支付记录
     */
    @Transactional(rollbackFor = Exception.class)
    public void refundByBusinessId(String businessId) {
        Optional<Payment> paymentOptional = Optional.ofNullable(paymentService.getAndCheckPaymentByBusinessId(businessId));
        paymentOptional.ifPresent(this::refundPayment);
    }

    /**
     * 退款
     */
    private void refundPayment(Payment payment){

        // 获取 paymentParam
        PayParam payParam = PaymentBuilder.buildPayParamByPayment(payment);;

        // 1.获取支付方式，通过工厂生成对应的策略组
        List<AbsPayStrategy> paymentStrategyList = PayStrategyFactory.create(payParam.getPayModeList());
        if (CollectionUtil.isEmpty(paymentStrategyList)) {
            throw new PaymentUnsupportedMethodException();
        }

        // 2.初始化支付的参数
        for (AbsPayStrategy paymentStrategy : paymentStrategyList) {
            paymentStrategy.initPayParam(payment, payParam);
        }

        // 3.执行取消订单
        this.doHandler(payment,paymentStrategyList,(strategyList, paymentObj) -> {
            // 发起支付成功进行的执行方法
            strategyList.forEach(AbsPayStrategy::doRefundHandler);
            paymentObj.setPayStatus(PayStatusCode.TRADE_REFUND);
            paymentManager.updateById(paymentObj);
        });
    }
    /**
     * 处理方法
     * @param payment 支付记录
     * @param strategyList 支付策略
     * @param successCallback 成功操作
     */
    private void doHandler(Payment payment,
                           List<AbsPayStrategy> strategyList,
                           PayStrategyConsumer<List<AbsPayStrategy>, Payment> successCallback) {

        try {
            // 执行
            successCallback.accept(strategyList, payment);
        } catch (Exception e) {
            // error事件的处理
            this.errorHandler(payment, strategyList, e);
            throw e;
        }
    }

    /**
     * 对Error的处理
     */
    private void errorHandler(Payment payment, List<AbsPayStrategy> strategyList, Exception e) {
        // 待编写
    }
}

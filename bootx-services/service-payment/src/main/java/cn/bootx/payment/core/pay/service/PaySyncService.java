package cn.bootx.payment.core.pay.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.code.pay.PaySyncStatus;
import cn.bootx.payment.core.pay.PayModelUtil;
import cn.bootx.payment.core.pay.builder.PaymentBuilder;
import cn.bootx.payment.core.pay.factory.PayStrategyFactory;
import cn.bootx.payment.core.pay.func.AbsPayStrategy;
import cn.bootx.payment.core.pay.func.PayStrategyConsumer;
import cn.bootx.payment.core.pay.result.PaySyncResult;
import cn.bootx.payment.core.payment.dao.PaymentManager;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.dto.pay.PayResult;
import cn.bootx.payment.exception.payment.PayFailureException;
import cn.bootx.payment.exception.payment.PayUnsupportedMethodException;
import cn.bootx.payment.mq.PaymentEventSender;
import cn.bootx.payment.param.pay.PayModeParam;
import cn.bootx.payment.param.pay.PayParam;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

/**
 * 未完成的异步支付单与支付网关进行对比
 * @author xxm
 * @date 2021/4/21
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class PaySyncService {
    private final PaymentManager paymentManager;
    private final PaymentEventSender eventSender;

    /**
     * 同步订单的支付状态
     */
    public void syncByBusinessId(String businessId){
        Payment payment = paymentManager.findByBusinessId(businessId).orElse(null);
        if (Objects.isNull(payment)){
            return ;
        }
        this.syncPayment(payment);
    }

    /**
     * 同步支付状态 传入 payment 对象
     */
    public void syncPayment(Payment payment){
        PayParam payParam = PaymentBuilder.buildPayParamByPayment(payment);
        // 1.获取支付方式，通过工厂生成对应的策略组
        List<AbsPayStrategy> paymentStrategyList = PayStrategyFactory.create(payParam.getPayModeList());
        if (CollUtil.isEmpty(paymentStrategyList)) {
            throw new PayUnsupportedMethodException();
        }

        // 2.初始化支付的参数
        for (AbsPayStrategy paymentStrategy : paymentStrategyList) {
            paymentStrategy.initPayParam(payment,payParam);
        }

        // 3 拿到异步支付方法, 与支付网关进行同步
        PayModeParam asyncPayMode = PayModelUtil.getAsyncPayModeParam(payParam);
        AbsPayStrategy syncPayStrategy = PayStrategyFactory.create(asyncPayMode);
        syncPayStrategy.initPayParam(payment,payParam);
        PaySyncResult paySyncResult = syncPayStrategy.doSyncPayStatusHandler();
        int paySyncStatus = paySyncResult.getPaySyncStatus();

        switch (paySyncStatus){
            // 支付成功 支付宝退款时也是支付成功状态, 除非支付完成
            case PaySyncStatus.TRADE_SUCCESS:{
                // payment 变更为支付成功
                this.paymentSuccess(payment,syncPayStrategy,paySyncResult);
                break;
            }
            // 待付款/ 支付中
            case PaySyncStatus.WAIT_BUYER_PAY:{
                log.info("依然是付款状态");
                break;
            }
            // 订单已经关闭超时关闭 和 网关没找到记录, 支付宝退款完成也是这个状态
            case PaySyncStatus.TRADE_CLOSED:
            case PaySyncStatus.NOT_FOUND: {
                // 判断下是否超时, 同时payment 变更为取消支付
                this.paymentCancel(payment,paymentStrategyList);
                break;
            }
            // 交易退款 支付宝没这个状态
            case PaySyncStatus.TRADE_REFUND:{
                this.paymentRefund(payment,syncPayStrategy,paySyncResult);
                break;
            }
            // 调用出错
            case PaySyncStatus.FAIL:{
                // 不进行处理
                log.warn("支付状态同步接口调用出错");
                break;
            }
            case PaySyncStatus.NOT_SYNC:
            default:{
                throw new BizException("代码有问题");
            }
        }
    }

    /**
     * payment 变更为取消支付
     */
    private void paymentCancel(Payment payment, List<AbsPayStrategy> absPayStrategies) {
        // 关闭本地支付记录
        this.doHandler(payment,absPayStrategies,(strategyList, paymentObj) -> {
            // 修改payment支付状态为取消, 退款状态则不进行更新
            if (Objects.equals(payment.getPayStatus(),PayStatusCode.TRADE_REFUNDED)){
                return;
            }
            if (Objects.equals(payment.getPayStatus(),PayStatusCode.TRADE_REFUNDING)){
                return;
            }

            payment.setPayStatus(PayStatusCode.TRADE_CANCEL);
            strategyList.forEach(AbsPayStrategy::doCloseHandler);
            paymentManager.updateById(payment);
        });
    }

    /**
     * payment 退款处理 TODO 需要考虑退款详情的合并处理
     */
    private void paymentRefund(Payment payment, AbsPayStrategy syncPayStrategy, PaySyncResult paySyncResult){

    }

    /**
     * payment 变更为已支付
     */
    private void paymentSuccess(Payment payment, AbsPayStrategy syncPayStrategy, PaySyncResult paySyncResult) {

        // 已支付不在重复处理
        if (Objects.equals(payment.getPayStatus(),PayStatusCode.TRADE_SUCCESS)){
            return;
        }
        // 退款的不处理
        if (Objects.equals(payment.getPayStatus(),PayStatusCode.TRADE_REFUNDED)){
            return;
        }
        if (Objects.equals(payment.getPayStatus(),PayStatusCode.TRADE_REFUNDING)){
            return;
        }

        syncPayStrategy.doAsyncSuccessHandler(paySyncResult.getMap());
        // 修改payment支付状态为成功
        payment.setPayStatus(PayStatusCode.TRADE_SUCCESS);
        payment.setPayTime(LocalDateTime.now());
        paymentManager.updateById(payment);

        // 发送成功事件
        PayResult payResult = PaymentBuilder.buildResultByPayment(payment);
        eventSender.sendPaymentCompleted(payResult);
    }

    /**
     * 处理方法
     * @param payment 支付记录
     * @param strategyList 支付策略
     * @param callback 回调
     */
    private void doHandler(Payment payment,
                           List<AbsPayStrategy> strategyList,
                           PayStrategyConsumer<List<AbsPayStrategy>, Payment> callback) {
        try {
            // 执行
            callback.accept(strategyList, payment);
        } catch (Exception e) {
            // error事件的处理
            this.errorHandler(payment, strategyList, e);
        }
    }
    /**
     * 对Error的处理
     */
    private void errorHandler(Payment payment, List<AbsPayStrategy> strategyList, Exception e) {
        // 待编写
        log.warn("支付状态同步方法报错了",e);
        throw new PayFailureException("支付状态同步方法报错了");
    }

}

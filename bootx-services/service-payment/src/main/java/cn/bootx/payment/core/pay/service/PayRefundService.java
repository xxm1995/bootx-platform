package cn.bootx.payment.core.pay.service;

import cn.bootx.common.core.util.BigDecimalUtil;
import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.core.pay.builder.PaymentBuilder;
import cn.bootx.payment.core.pay.factory.PayStrategyFactory;
import cn.bootx.payment.core.pay.func.AbsPayStrategy;
import cn.bootx.payment.core.pay.func.PayStrategyConsumer;
import cn.bootx.payment.core.payment.dao.PaymentManager;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.core.payment.service.PaymentService;
import cn.bootx.payment.core.refund.dao.RefundRecordManager;
import cn.bootx.payment.dto.payment.PayChannelInfo;
import cn.bootx.payment.dto.payment.RefundableInfo;
import cn.bootx.payment.exception.payment.PayAmountAbnormalException;
import cn.bootx.payment.exception.payment.PayFailureException;
import cn.bootx.payment.exception.payment.PayUnsupportedMethodException;
import cn.bootx.payment.param.pay.PayModeParam;
import cn.bootx.payment.param.pay.PayParam;
import cn.bootx.payment.param.refund.RefundModeParam;
import cn.bootx.payment.param.refund.RefundParam;
import cn.hutool.core.collection.CollectionUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

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
    private final RefundRecordManager refundRecordManager;

    /**
     * 退款
     */
    @Transactional(rollbackFor = Exception.class)
    public void refund(RefundParam refundParam) {
        Optional<Payment> paymentOptional = Optional.ofNullable(paymentService.getAndCheckPaymentByBusinessId(refundParam.getBusinessId()));
        paymentOptional.ifPresent(payment -> this.refundPayment(payment,refundParam.getRefundModeParams()));
    }

    /**
     * 根据业务id取消支付记录
     */
    @Transactional(rollbackFor = Exception.class)
    public void refundByBusinessId(String businessId) {
        Optional<Payment> paymentOptional = Optional.ofNullable(paymentService.getAndCheckPaymentByBusinessId(businessId));
        paymentOptional.ifPresent(payment -> this.refundPayment(payment,payment.getRefundableInfoList().stream()
                        .map(o -> new RefundModeParam()
                                .setPayChannel(o.getPayChannel())
                                .setAmount(o.getAmount()))
                        .collect(Collectors.toList())
                )
        );
    }

    /**
     * 退款
     */
    private void refundPayment(Payment payment, List<RefundModeParam> refundModeParams){

        // 获取 paymentParam
        PayParam payParam = PaymentBuilder.buildPayParamByPayment(payment);
        // 退款参数检查
        this.payModeCheck(refundModeParams,payment.getRefundableInfoList());

        // 1.获取退款参数方式，通过工厂生成对应的策略组
        List<PayModeParam> payModeParams = refundModeParams.stream().map(RefundModeParam::toPayModeParam).collect(Collectors.toList());
        List<AbsPayStrategy> paymentStrategyList = PayStrategyFactory.create(payModeParams);
        if (CollectionUtil.isEmpty(paymentStrategyList)) {
            throw new PayUnsupportedMethodException();
        }

        // 2.初始化支付的参数
        for (AbsPayStrategy paymentStrategy : paymentStrategyList) {
            paymentStrategy.initPayParam(payment, payParam);
        }

        // 3.执行退款
        this.doHandler(payment,paymentStrategyList,(strategyList, paymentObj) -> {
            // 发起支付成功进行的执行方法
            strategyList.forEach(AbsPayStrategy::doRefundHandler);
            paymentObj.setPayStatus(PayStatusCode.TRADE_REFUND);
            paymentManager.updateById(paymentObj);
            // 记录退款成功的记录
            this.saveRefund(payment);

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
        log.warn("退款失败");
    }

    /**
     * 支付方式检查
     * @param refundPayModes 退款参数
     * @param refundableInfos 可退款信息
     */
    private void payModeCheck(List<RefundModeParam> refundPayModes,List<RefundableInfo> refundableInfos){
        Map<Integer, RefundableInfo> payModeMap = refundableInfos.stream().collect(Collectors.toMap(RefundableInfo::getPayChannel, o -> o));
        for (RefundModeParam refundPayMode : refundPayModes) {
            this.payModeCheck(refundPayMode,payModeMap.get(refundPayMode.getPayChannel()));
        }
    }

    /**
     * 支付方式检查
     */
    public void payModeCheck(RefundModeParam refundPayMode,RefundableInfo refundableInfo){
        if (Objects.isNull(refundableInfo)){
            throw new PayFailureException("退款参数非法");
        }
        // 金额检查
        if (BigDecimalUtil.compareTo(refundPayMode.getAmount(),BigDecimal.ZERO) < 1){
            throw new PayAmountAbnormalException();
        }
        // 退款金额
        if (BigDecimalUtil.compareTo(refundPayMode.getAmount(),refundableInfo.getAmount()) == 1){
            throw new PayAmountAbnormalException();
        }

    }

    /**
     * 保存退款记录
     */
    private void saveRefund(Payment payment){
        // TODO
        List<PayChannelInfo> payTypeInfos = payment.getPayChannelInfoList();
    }
}

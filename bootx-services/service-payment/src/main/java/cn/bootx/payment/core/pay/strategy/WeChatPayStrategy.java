package cn.bootx.payment.core.pay.strategy;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.BigDecimalUtil;
import cn.bootx.payment.code.pay.PayChannelCode;
import cn.bootx.payment.code.paymodel.WeChatPayCode;
import cn.bootx.payment.core.pay.result.PaySyncResult;
import cn.bootx.payment.core.pay.exception.ExceptionInfo;
import cn.bootx.payment.core.pay.func.AbsPayStrategy;
import cn.bootx.payment.core.paymodel.wechat.dao.WeChatPayConfigManager;
import cn.bootx.payment.core.paymodel.wechat.entity.WeChatPayConfig;
import cn.bootx.payment.core.paymodel.wechat.service.*;
import cn.bootx.payment.exception.payment.PayAmountAbnormalException;
import cn.bootx.payment.param.pay.PayModeParam;
import cn.bootx.payment.param.paymodel.wechat.WeChatPayParam;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONException;
import cn.hutool.json.JSONUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Map;
import java.util.Optional;

import static org.springframework.beans.factory.config.BeanDefinition.SCOPE_PROTOTYPE;

/**
 * 微信支付
 * @author xxm
 * @date 2021/4/5
 */
@Scope(SCOPE_PROTOTYPE)
@Component
@RequiredArgsConstructor
public class WeChatPayStrategy extends AbsPayStrategy {

    private final WeChatPayConfigManager weChatPayConfigManager;
    private final WeChatPayService weChatPayService;
    private final WeChatPaymentService weChatPaymentService;
    private final WeChatPayCancelService weChatPayCancelService;
    private final WeChatPaySyncService weChatPaySyncService;

    private WeChatPayConfig weChatPayConfig;
    private WeChatPayParam weChatPayParam;

    /**
     * 类型
     */
    @Override
    public int getType() {
        return PayChannelCode.WECHAT;
    }

    /**
     * 支付前操作
     */
    @Override
    public void doBeforePayHandler(){
        try {
            // 微信参数验证
            String extraParamsJson = this.getPayMode().getExtraParamsJson();
            if (StrUtil.isNotBlank(extraParamsJson)){

                this.weChatPayParam = JSONUtil.toBean(extraParamsJson, WeChatPayParam.class);
            } else {
                this.weChatPayParam = new WeChatPayParam();
            }
        } catch (JSONException e) {
            throw new BizException("支付参数错误");
        }

        // 检查金额
        PayModeParam payMode = this.getPayMode();
        if (BigDecimalUtil.compareTo(payMode.getAmount(), BigDecimal.ZERO) < 1){
            throw new PayAmountAbnormalException();
        }

        // 检查并获取微信支付配置
        this.weChatPayConfig = weChatPayConfigManager.findEnable()
                .orElseThrow(() -> new BizException("微信支付配置不存在"));
        weChatPayService.validation(this.getPayMode(),weChatPayConfig);
        WeChatPayConfigService.initApiConfig(weChatPayConfig);
    }

    /**
     * 发起支付
     */
    @Override
    public void doPayHandler() {
        weChatPayService.pay(this.getPayMode().getAmount(),
                this.getPayment(),
                this.weChatPayParam,
                this.getPayMode(),
                this.weChatPayConfig);
    }

    /**
     * 支付调起成功
     */
    @Override
    public void doSuccessHandler(){
        weChatPaymentService.updatePaySuccess(this.getPayment(),this.getPayMode());
    }
    /**
     * 错误处理
     */
    @Override
    public void doErrorHandler(ExceptionInfo exceptionInfo) {
        this.doCloseHandler();
    }

    /**
     * 异步支付成功
     */
    @Override
    public void doAsyncSuccessHandler(Map<String, String> map) {
        String tradeNo = map.get(WeChatPayCode.OUT_TRADE_NO);
        weChatPaymentService.updateSyncSuccess(this.getPayment().getId(),this.getPayMode(),tradeNo);
    }

    /**
     * 异步支付失败
     */
    @Override
    public void doAsyncErrorHandler(ExceptionInfo exceptionInfo) {
        // 调用撤销支付
        this.doCancelHandler();
    }

    /**
     * 撤销支付
     */
    @Override
    public void doCancelHandler() {
        // 检查并获取微信支付配置
        this.weChatPayConfig = Optional.ofNullable(this.weChatPayConfig)
                .orElse(weChatPayConfigManager.findEnable()
                        .orElseThrow(() -> new BizException("支付配置不存在")));
        WeChatPayConfigService.initApiConfig(weChatPayConfig);
        weChatPayCancelService.cancelRemote(this.getPayment(),weChatPayConfig);
        // 调用关闭本地支付记录
        this.doCloseHandler();
    }

    /**
     * 关闭本地支付记录
     */
    @Override
    public void doCloseHandler() {
        weChatPaymentService.updateClose(this.getPayment().getId());
    }

    /**
     * 退款
     */
    @Override
    public void doRefundHandler() {

    }

    /**
     * 异步支付单与支付网关进行状态比对
     */
    @Override
    public PaySyncResult doSyncPayStatusHandler(){
        // 检查并获取微信支付配置
        this.weChatPayConfig = Optional.ofNullable(this.weChatPayConfig)
                .orElse(weChatPayConfigManager.findEnable()
                        .orElseThrow(() -> new BizException("支付配置不存在")));
        WeChatPayConfigService.initApiConfig(weChatPayConfig);
        return weChatPaySyncService.syncPayStatus(this.getPayment().getId(),this.weChatPayConfig);
    }
}

package cn.bootx.payment.core.paymodel.wechat.service;

import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.code.pay.PayWayCode;
import cn.bootx.payment.code.pay.PayWayEnum;
import cn.bootx.payment.code.paymodel.WeChatPayCode;
import cn.bootx.payment.code.paymodel.WeChatPayWay;
import cn.bootx.payment.core.pay.local.AsyncPayInfoLocal;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.core.paymodel.wechat.entity.WeChatPayConfig;
import cn.bootx.payment.dto.pay.AsyncPayInfo;
import cn.bootx.payment.exception.payment.PayFailureException;
import cn.bootx.payment.param.pay.PayModeParam;
import cn.bootx.payment.param.paymodel.wechat.WeChatPayParam;
import cn.hutool.core.net.NetUtil;
import cn.hutool.core.util.StrUtil;
import com.ijpay.core.enums.SignType;
import com.ijpay.core.enums.TradeType;
import com.ijpay.core.kit.WxPayKit;
import com.ijpay.wxpay.WxPayApi;
import com.ijpay.wxpay.model.MicroPayModel;
import com.ijpay.wxpay.model.UnifiedOrderModel;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;

/**
 * 微信支付
 * @author xxm
 * @date 2021/3/2
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class WeChatPayService {

    /**
     * 校验
     */
    public void validation(PayModeParam payModeParam, WeChatPayConfig weChatPayConfig) {
        List<String> payWays = Optional.ofNullable(weChatPayConfig.getPayWays())
                .filter(StrUtil::isNotBlank)
                .map(s -> StrUtil.split(s, ','))
                .orElse(new ArrayList<>(1));

        PayWayEnum payWayEnum = Optional.ofNullable(WeChatPayWay.findByNo(payModeParam.getPayWay()))
                .orElseThrow(() -> new PayFailureException("非法的微信支付类型"));
        if (!payWays.contains(payWayEnum.getCode())) {
            throw new PayFailureException("该微信支付方式不可用");
        }
    }

    /**
     * 支付
     */
    public void pay(BigDecimal amount, Payment payment, WeChatPayParam weChatPayParam, PayModeParam payModeParam, WeChatPayConfig weChatPayConfig){
        String totalFee = String.valueOf(amount.multiply(new BigDecimal(100)).longValue());

        String payBody = null;

        // wap支付
        if (payModeParam.getPayWay() == PayWayCode.WAP){
            payBody = this.wapPay(totalFee, payment,weChatPayConfig);
        }
        // APP支付
        else if (payModeParam.getPayWay() == PayWayCode.APP){
            payBody = this.appPay(totalFee, payment, weChatPayConfig);
        }
        // 微信公众号支付或者小程序支付
        else if (payModeParam.getPayWay() == PayWayCode.JSAPI){
            payBody = this.jsPay(totalFee, payment,weChatPayParam.getOpenId(), weChatPayConfig);
        }
        // 二维码支付
        else if (payModeParam.getPayWay() == PayWayCode.QRCODE){
            payBody = this.qrCodePay(totalFee, payment, weChatPayConfig);
        }
        // 付款码支付
        else if (payModeParam.getPayWay() == PayWayCode.BARCODE){
            this.barCode(totalFee, payment, weChatPayParam.getAuthCode(), weChatPayConfig);
        }
        // payBody到线程存储
        if (StrUtil.isNotBlank(payBody)) {
            AsyncPayInfo asyncPayInfo = new AsyncPayInfo()
                    .setPayBody(payBody);
            AsyncPayInfoLocal.set(asyncPayInfo);
        }
    }

    /**
     * wap支付
     */
    private String wapPay(String amount, Payment payment, WeChatPayConfig weChatPayConfig) {
        Map<String, String> params = this.buildParams(amount,payment,weChatPayConfig,TradeType.MWEB.getTradeType())
                .build()
                .createSign(weChatPayConfig.getApiKeyV2(), SignType.HMACSHA256);

        String xmlResult = WxPayApi.pushOrder(false, params);
        Map<String, String> result = WxPayKit.xmlToMap(xmlResult);
        this.verifyErrorMsg(result);
        return result.get(WeChatPayCode.MWEB_URL);
    }

    /**
     * 程序支付
     */
    private String appPay(String amount, Payment payment, WeChatPayConfig weChatPayConfig) {
        Map<String, String> params = this.buildParams(amount,payment,weChatPayConfig,TradeType.APP.getTradeType())
                .build()
                .createSign(weChatPayConfig.getApiKeyV2(), SignType.HMACSHA256);

        String xmlResult = WxPayApi.pushOrder(false, params);
        Map<String, String> result = WxPayKit.xmlToMap(xmlResult);
        this.verifyErrorMsg(result);
        return result.get(WeChatPayCode.PREPAY_ID);
    }


    /**
     * 微信公众号支付或者小程序支付
     */
    private String jsPay(String amount, Payment payment, String openId, WeChatPayConfig weChatPayConfig) {
        Map<String, String> params = this.buildParams(amount,payment,weChatPayConfig,TradeType.JSAPI.getTradeType())
                .openid(openId)
                .build()
                .createSign(weChatPayConfig.getApiKeyV2(), SignType.HMACSHA256);

        String xmlResult = WxPayApi.pushOrder(false, params);
        Map<String, String> result = WxPayKit.xmlToMap(xmlResult);
        this.verifyErrorMsg(result);
        return result.get(WeChatPayCode.PREPAY_ID);
    }

    /**
     * 二维码支付
     */
    private String qrCodePay(String amount, Payment payment, WeChatPayConfig weChatPayConfig) {

        Map<String, String> params = this.buildParams(amount,payment,weChatPayConfig,TradeType.NATIVE.getTradeType())
                .build()
                .createSign(weChatPayConfig.getApiKeyV2(), SignType.HMACSHA256);

        String xmlResult = WxPayApi.pushOrder(false, params);
        Map<String, String> result = WxPayKit.xmlToMap(xmlResult);
        this.verifyErrorMsg(result);
        return result.get(WeChatPayCode.CODE_URL);
    }

    /**
     * 条形码支付
     */
    private void barCode(String amount, Payment payment, String authCode, WeChatPayConfig weChatPayConfig) {
        Map<String, String> params = MicroPayModel
                .builder()
                .appid(weChatPayConfig.getAppId())
                .mch_id(weChatPayConfig.getMchId())
                .nonce_str(WxPayKit.generateStr())
                .body(payment.getTitle())
                .auth_code(authCode)
                .out_trade_no(String.valueOf(payment.getId()))
                .total_fee(amount)
                .spbill_create_ip(NetUtil.getLocalhostStr())
                .build()
                .createSign(weChatPayConfig.getApiKeyV2(), SignType.HMACSHA256);

        String xmlResult = WxPayApi.microPay(false, params);
        Map<String, String> result = WxPayKit.xmlToMap(xmlResult);
//        this.verifyErrorMsg(result);
        String tradeType = result.get(WeChatPayCode.TRADE_TYPE);
        // 支付成功处理
        if (Objects.equals(result.get(WeChatPayCode.TRADE_STATE), WeChatPayCode.TRADE_SUCCESS)) {
            payment.setPayStatus(PayStatusCode.TRADE_SUCCESS)
                    .setPayTime(LocalDateTime.now());
            return;
        }
    }

    /**
     * 构建参数
     */
    private UnifiedOrderModel.UnifiedOrderModelBuilder buildParams(String amount,
                                                                   Payment payment,
                                                                   WeChatPayConfig weChatPayConfig,
                                                                   String tradeType){
        return UnifiedOrderModel
                .builder()
                .appid(weChatPayConfig.getAppId())
                .mch_id(weChatPayConfig.getMchId())
                .nonce_str(WxPayKit.generateStr())
                .body(payment.getTitle())
                .out_trade_no(String.valueOf(payment.getId()))
                .total_fee(amount)
                .spbill_create_ip(NetUtil.getLocalhostStr())
                .notify_url(weChatPayConfig.getNotifyUrl())
                .trade_type(tradeType);
    }


    /**
     * 验证错误信息
     */
    private void verifyErrorMsg(Map<String, String> result){
        String returnCode = result.get(WeChatPayCode.RETURN_CODE);
        String resultCode = result.get(WeChatPayCode.RESULT_CODE);
        if (!WxPayKit.codeIsOk(returnCode)||!WxPayKit.codeIsOk(resultCode)) {
            String errorMsg = result.get(WeChatPayCode.ERR_CODE_DES);
            if (StrUtil.isBlank(errorMsg)){
                errorMsg = result.get(WeChatPayCode.RETURN_MSG);
            }
            log.error("支付失败 {}", errorMsg);
            throw new PayFailureException(errorMsg);
        }
    }

}

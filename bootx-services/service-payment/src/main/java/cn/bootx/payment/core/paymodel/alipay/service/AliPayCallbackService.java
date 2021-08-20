package cn.bootx.payment.core.paymodel.alipay.service;

import cn.bootx.common.redis.RedisClient;
import cn.bootx.payment.code.pay.PayChannelCode;
import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.code.paymodel.AliPayCode;
import cn.bootx.payment.core.pay.func.AbsPayCallbackStrategy;
import cn.bootx.payment.core.pay.service.PayCallbackService;
import cn.bootx.payment.core.paymodel.alipay.dao.AlipayConfigManager;
import cn.bootx.payment.core.paymodel.alipay.entity.AlipayConfig;
import cn.bootx.payment.core.paymodel.base.service.PayNotifyRecordService;
import cn.hutool.core.util.CharsetUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayConstants;
import com.alipay.api.internal.util.AlipaySignature;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.Objects;

/**
* 支付宝回调处理
* @author xxm
* @date 2021/2/28
*/
@Slf4j
@Service
public class AliPayCallbackService extends AbsPayCallbackStrategy {
    private final AlipayConfigManager alipayConfigManager;

    public AliPayCallbackService(RedisClient redisClient, PayNotifyRecordService payNotifyRecordService, PayCallbackService payCallbackService, AlipayConfigService alipayConfigService, AlipayConfigManager alipayConfigManager) {
        super(redisClient, payNotifyRecordService, payCallbackService);
        this.alipayConfigManager = alipayConfigManager;
    }

    @Override
    public int getPayChannel() {
        return PayChannelCode.ALI;
    }

    @Override
    public int getTradeStatus() {
        Map<String, String> params = PARAMS.get();
        String tradeStatus = params.get(AliPayCode.TRADE_STATUS);
        if (Objects.equals(tradeStatus,AliPayCode.NOTIFY_TRADE_SUCCESS)){
            return PayStatusCode.NOTIFY_TRADE_SUCCESS;
        }
        return PayStatusCode.NOTIFY_TRADE_FAIL;
    }

    @Override
    public boolean verifyNotify() {
        Map<String, String> params = PARAMS.get();
        String callReq = JSONUtil.toJsonStr(params);
        String appId = params.get("app_id");
        if (StrUtil.isBlank(appId)) {
            log.warn("支付宝回调报文 appId 为空 {}", callReq);
            return false;
        }
        AlipayConfig alipayConfig = alipayConfigManager.findActivity().orElse(null);
        if (alipayConfig == null) {
            log.warn("支付宝回调报文 appId 不合法 {}", callReq);
            return false;
        }
        try {
            return AlipaySignature.rsaCheckV1(params, alipayConfig.getAlipayPublicKey(), CharsetUtil.UTF_8, AlipayConstants.SIGN_TYPE_RSA2);
        }
        catch (AlipayApiException e) {
            log.error("支付宝验签失败", e);
            return false;
        }
    }

    @Override
    public Long getPaymentId() {
        Map<String, String> params = PARAMS.get();
        return Long.valueOf(params.get(AliPayCode.OUT_TRADE_NO));
    }

    @Override
    public String getReturnMsg() {
        return "success";
    }

}

package cn.bootx.payment.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.payment.core.pay.service.PayCancelService;
import cn.bootx.payment.core.pay.service.PayService;
import cn.bootx.payment.core.pay.service.PaySyncService;
import cn.bootx.payment.dto.pay.PayResult;
import cn.bootx.payment.dto.payment.PaymentDto;
import cn.bootx.payment.param.pay.PayParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author xxm
 * @date 2020/12/9
 */
@Api(tags = "统一支付")
@RestController
@RequestMapping("/uni_pay")
@AllArgsConstructor
public class PayController {
    private final PayService payService;
    private final PayCancelService cancelService;
    private final PaySyncService paySyncService;

    @ApiOperation("支付")
    @PostMapping("/pay")
    public ResResult<PayResult>pay(@RequestBody PayParam payParam){
        return Res.ok(payService.pay(payParam));
    }

    @ApiOperation("取消支付(支付id)")
    @PostMapping("/cancelByPaymentId")
    public ResResult<Void> cancelByPaymentId(Long paymentId){
        cancelService.cancelByPaymentId(paymentId);
        return Res.ok();
    }

    @ApiOperation("取消支付(业务id)")
    @PostMapping("/cancelByBusinessId")
    public ResResult<Void> cancelByBusinessId(String businessId){
        cancelService.cancelByBusinessId(businessId);
        return Res.ok();
    }
    
    @ApiOperation("刷新指定业务id的支付单状态")
    @PostMapping("/syncByBusinessId")
    public ResResult<PaymentDto> syncByBusinessId(String businessId){
        return Res.ok(paySyncService.syncByBusinessId(businessId));
    }
}

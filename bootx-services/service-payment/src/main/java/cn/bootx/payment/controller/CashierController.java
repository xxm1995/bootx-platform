package cn.bootx.payment.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.payment.code.pay.PayChannelCode;
import cn.bootx.payment.core.aggregate.entity.AggregatePayInfo;
import cn.bootx.payment.core.aggregate.service.AggregateService;
import cn.bootx.payment.core.cashier.service.CashierService;
import cn.bootx.payment.dto.pay.PayResult;
import cn.bootx.payment.param.cashier.CashierCombinationPayParam;
import cn.bootx.payment.param.cashier.CashierSinglePayParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
*
* @author xxm
* @date 2022/2/23
*/
@Tag(name = "结算台")
@RestController
@RequestMapping("/cashier")
@RequiredArgsConstructor
public class CashierController {
    private final CashierService cashierService;
    private final AggregateService aggregateService;

    @Operation(summary = "发起支付(单渠道)")
    @PostMapping("/singlePay")
    public ResResult<PayResult> singlePay(@RequestBody CashierSinglePayParam cashierSinglePayParam){
        return Res.ok(cashierService.singlePay(cashierSinglePayParam));
    }

    @Operation(summary = "发起支付(组合支付)")
    @PostMapping("/combinationPay")
    public ResResult<PayResult> combinationPay(@RequestBody CashierCombinationPayParam param){
        return Res.ok(cashierService.combinationPay(param));
    }

    @Operation(summary = "扫码聚合支付(单渠道)")
    @GetMapping("/aggregatePay")
    public ModelAndView aggregatePay(HttpServletRequest request){
        String ua = request.getHeader("User-Agent");
        // 判断是哪种支付方式
        if (ua.contains(PayChannelCode.UA_ALI_PAY)) {
            return new ModelAndView("forward:/cashier/h5/wechat");
        }
        else if (ua.contains(PayChannelCode.UA_WECHAT_PAY)) {
            return new ModelAndView("forward:/cashier/h5/wechat");
        } else {
//            return new ModelAndView("errorCashier");
            return new ModelAndView("forward:/cashier/h5/wechat");
        }

    }

    @Operation(summary = "微信h5支付")
    @GetMapping("/h5/wechat")
    public ModelAndView wechat(String key){
        AggregatePayInfo aggregateInfo = aggregateService.getAggregateInfo(key);
        return new ModelAndView("wechatCashier")
                .addObject("aggregateInfo",aggregateInfo);
    }

    @Operation(summary = "支付宝h5支付")
    @GetMapping("/h5/alipay")
    public ModelAndView alipay(String key){
        AggregatePayInfo aggregateInfo = aggregateService.getAggregateInfo(key);
        return new ModelAndView("alipayCashier")
                .addObject("aggregateInfo",aggregateInfo);
    }



}

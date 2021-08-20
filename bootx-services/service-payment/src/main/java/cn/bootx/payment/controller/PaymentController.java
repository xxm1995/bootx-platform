package cn.bootx.payment.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.payment.core.payment.service.PaymentQueryService;
import cn.bootx.payment.dto.pay.PayChannelInfo;
import cn.bootx.payment.dto.payment.PaymentDto;
import cn.bootx.payment.param.payment.PaymentQuery;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
* @author xxm
* @date 2021/6/28
*/
@Api(tags = "支付记录")
@RestController
@RequestMapping("/payment")
@RequiredArgsConstructor
public class PaymentController {
    private final PaymentQueryService paymentQueryService;

    @ApiOperation("根据id获取")
    @GetMapping("/findById")
    public ResResult<PaymentDto> findById(Long id){
        return Res.ok(paymentQueryService.findById(id));
    }

    @ApiOperation("根据userId获取列表")
    @GetMapping("/findByUser")
    public ResResult<List<PaymentDto>> findByUser(Long userid){
        return Res.ok(paymentQueryService.findByUser(userid));
    }

    @ApiOperation("分页查询")
    @GetMapping("/page")
    public ResResult<PageResult<PaymentDto>> page(PageParam pageParam, PaymentQuery param){
        return Res.ok(paymentQueryService.page(pageParam,param));
    }

    @ApiOperation("根据businessId获取列表")
    @GetMapping("/findByBusinessId")
    public ResResult<List<PaymentDto>> findByBusinessId(String businessId){
        return Res.ok(paymentQueryService.findByBusinessId(businessId));
    }

    @ApiOperation("根据businessId获取订单支付方式")
    @GetMapping("/findPayTypeInfoByBusinessId")
    public ResResult<List<PayChannelInfo>> findPayTypeInfoByBusinessId(String businessId){
        return Res.ok(paymentQueryService.findPayTypeInfoByBusinessId(businessId));
    }
    @ApiOperation("根据id获取订单支付方式")
    @GetMapping("/findPayTypeInfoById")
    public ResResult<List<PayChannelInfo>> findPayTypeInfoById(Long id){
        return Res.ok(paymentQueryService.findPayTypeInfoById(id));
    }

}

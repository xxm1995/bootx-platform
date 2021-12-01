package cn.bootx.order.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.order.core.order.service.OrderOperateService;
import cn.bootx.order.dto.order.OrderDto;
import cn.bootx.order.param.order.OrderWholeParam;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
*
* @author xxm
* @date 2021/4/13
*/
@Tag(name ="订单操作")
@RestController
@RequestMapping("/order")
@AllArgsConstructor
public class OrderOperateController {
    private final OrderOperateService orderOperateService;

    @Operation(summary = "传入订单和优惠, 下单")
    @PostMapping("/placeOrder")
    public ResResult<OrderDto> placeOrder(@RequestBody OrderWholeParam orderWholeParam){
        return Res.ok(orderOperateService.placeOrder(orderWholeParam));
    }

    @Operation(summary = "付款成功状态变更")
    @PostMapping("/paidOrderState")
    public ResResult<Void> paidOrderState(Long orderId){
        orderOperateService.paidOrderState(orderId);
        return Res.ok();
    }

    @Operation(summary = "取消订单")
    @PostMapping("/cancelOrderState")
    public ResResult<Void> cancelOrderState(Long orderId) {
        orderOperateService.cancelOrderState(orderId);
        return Res.ok();
    }
}

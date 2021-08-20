package cn.bootx.sales.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.sales.core.recommend.OrderFindActivityService;
import cn.bootx.sales.core.recommend.OrderFindCouponService;
import cn.bootx.sales.dto.coupon.CouponDto;
import cn.bootx.sales.dto.order.GoodsActivityResult;
import cn.bootx.sales.param.order.OrderCheckParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
* @author xxm
* @date 2021/5/14
*/
@Api(tags = "订单优惠选择与推荐")
@RestController
@RequestMapping("/order/recommend")
@AllArgsConstructor
public class OrderRecommendController {

    private final OrderFindCouponService couponSelectCheckService;
    private final OrderFindActivityService orderFindActivityService;


    @ApiOperation("查询适用的活动")
    @PostMapping("/findActivity")
    public ResResult<List<GoodsActivityResult>> findActivity(@RequestBody OrderCheckParam orderParam){
        return Res.ok(orderFindActivityService.findActivity(orderParam));
    }

    @ApiOperation("查询适用的优惠券")
    @PostMapping("/findCoupon")
    public ResResult<List<CouponDto>> findCoupon(@RequestBody OrderCheckParam orderParam){
        return Res.ok(couponSelectCheckService.findCoupon(orderParam));
    }
}

package cn.bootx.sales.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.sales.core.coupon.service.CouponService;
import cn.bootx.sales.dto.coupon.CouponDto;
import cn.bootx.sales.param.coupon.ObtainCouponParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* @author xxm
* @date 2020/11/1
*/
@Api(tags = "优惠券")
@RestController
@RequestMapping("/coupon")
@RequiredArgsConstructor
public class CouponController {
    private final CouponService couponService;

    @ApiOperation("领取优惠券")
    @PostMapping("/obtainCoupon")
    public ResResult<Void> obtainCoupon(@RequestBody ObtainCouponParam param){
        couponService.obtainCoupon(param);
        return Res.ok();
    }

    @ApiOperation("个人可用的优惠券")
    @GetMapping("/findCoupon")
    public ResResult<List<CouponDto>> findCoupon(Long userId){
        return Res.ok(couponService.findCouponByUserId(userId));
    }

    @ApiOperation("批量优惠券")
    @GetMapping("/getById")
    public ResResult<CouponDto> getByIds(Long couponId){
        return Res.ok(couponService.getById(couponId));
    }

    @ApiOperation("批量查询优惠券")
    @GetMapping("/findByIds")
    public ResResult<List<CouponDto>> findByIds(List<Long> couponIds){
        return Res.ok(couponService.findByIds(couponIds));
    }

    @ApiOperation("锁定优惠券")
    @PostMapping("/lockById")
    public ResResult<Void> lockById(Long couponId){
        couponService.lockById(couponId);
        return Res.ok();
    }

    @ApiOperation("批量锁定优惠券")
    @PostMapping("/lockByIds")
    public ResResult<Void> lockByIds(List<Long> couponIds){
        couponService.lockByIds(couponIds);
        return Res.ok();
    }


}

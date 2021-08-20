package cn.bootx.sales.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.sales.core.coupon.service.CouponTemplateService;
import cn.bootx.sales.dto.coupon.CouponTemplateDto;
import cn.bootx.sales.param.coupon.CouponTemplateParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* @author xxm
* @date 2020/11/1
*/
@Api(tags = "优惠券模板")
@RestController
@RequestMapping("/coupon/template")
@AllArgsConstructor
public class CouponTemplateController {
    private final CouponTemplateService couponTemplateService;

    @ApiOperation("新建优惠券模板")
    @PostMapping("/add")
    public ResResult<CouponTemplateDto> addCouponTemplate(@RequestBody CouponTemplateParam param){
        return Res.ok(couponTemplateService.add(param));
    }

    @ApiOperation("查询优惠券模板")
    @PostMapping("/findAll")
    public ResResult<List<CouponTemplateDto>> findAll(){
        return Res.ok(couponTemplateService.findAll());
    }

    @ApiOperation("优惠券模板详情")
    @PostMapping("/get/{id}")
    public ResResult<CouponTemplateDto> get(@PathVariable Long id){
        return Res.ok(couponTemplateService.findById(id));
    }
}

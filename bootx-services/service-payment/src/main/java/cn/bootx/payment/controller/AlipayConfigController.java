package cn.bootx.payment.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.payment.core.paymodel.alipay.service.AlipayConfigService;
import cn.bootx.payment.dto.paymodel.alipay.AlipayConfigDto;
import cn.bootx.payment.param.paymodel.alipay.AlipayConfigParam;
import cn.bootx.payment.param.paymodel.alipay.AlipayConfigQuery;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
* @author xxm
* @date 2021/2/26
*/
@Api(tags = "支付宝配置")
@RestController
@RequestMapping("/alipay")
@AllArgsConstructor
public class AlipayConfigController {
    private final AlipayConfigService alipayConfigService;

    @ApiOperation("添加")
    @PostMapping("/add")
    public ResResult<AlipayConfigDto> add(@RequestBody AlipayConfigParam param){
        return Res.ok(alipayConfigService.add(param));
    }

    @ApiOperation("更新")
    @PostMapping("/update")
    public ResResult<AlipayConfigDto> update(@RequestBody AlipayConfigParam param){
        return Res.ok(alipayConfigService.update(param));
    }

    @ApiOperation("分页")
    @GetMapping("/page")
    public ResResult<PageResult<AlipayConfigDto>> page(PageParam pageParam, AlipayConfigQuery param){
        return Res.ok(alipayConfigService.page(pageParam,param));
    }

    @ApiOperation("根据Id查询")
    @GetMapping("/findById")
    public ResResult<AlipayConfigDto> findById(Long id){
        return Res.ok(alipayConfigService.findById(id));
    }
}

package cn.bootx.payment.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.payment.core.paymodel.wechat.service.WeChatPayConfigService;
import cn.bootx.payment.dto.paymodel.wechat.WeChatPayConfigDto;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
* @author xxm
* @date 2021/3/19
*/
@Api(tags = "微信支付")
@RestController
@RequestMapping("/wechat/pay")
@AllArgsConstructor
public class WeChatPayConfigController {
    private final WeChatPayConfigService weChatPayConfigService;

    @ApiOperation("添加微信支付配置")
    @PostMapping("/add")
    public ResResult<WeChatPayConfigDto> add(@RequestBody WeChatPayConfigDto param){
        return Res.ok(weChatPayConfigService.add(param));
    }
    
    @ApiOperation("更新")
    @PostMapping("/update")
    public ResResult<WeChatPayConfigDto> update(@RequestBody WeChatPayConfigDto param){
        return Res.ok(weChatPayConfigService.update(param));
    }
    
    @ApiOperation("设置启用的微信支付配置")
    @PostMapping("/setUpActivity")
    public ResResult<WeChatPayConfigDto> setUpActivity(Long id){
        weChatPayConfigService.setUpActivity(id);
        return Res.ok();
    }

    @ApiOperation("分页")
    @GetMapping("/page")
    public ResResult<PageResult<WeChatPayConfigDto>> page(PageParam pageParam){
        return Res.ok(weChatPayConfigService.page(pageParam));
    }
}

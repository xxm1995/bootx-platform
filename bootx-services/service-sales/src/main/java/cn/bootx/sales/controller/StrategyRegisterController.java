package cn.bootx.sales.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.sales.core.strategy.service.StrategyRegisterService;
import cn.bootx.sales.dto.strategy.StrategyRegisterDto;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author xxm
 * @date 2020/10/17
 */
@Api(tags = "策略注册")
@RestController
@RequestMapping("/strategy/register")
@AllArgsConstructor
public class StrategyRegisterController {
    private final StrategyRegisterService strategyRegisterService;


    @ApiOperation("查询全部")
    @GetMapping("/findAll")
    public ResResult<List<StrategyRegisterDto>> findAll(){
        return Res.ok(strategyRegisterService.findAll());
    }

    @ApiOperation("删除")
    @DeleteMapping("/del/{id}")
    public ResResult<Void> delete(@PathVariable Long id){
        strategyRegisterService.deleteById(id);
        return Res.ok();
    }

}

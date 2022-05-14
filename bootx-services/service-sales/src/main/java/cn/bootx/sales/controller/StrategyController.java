package cn.bootx.sales.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.sales.core.strategy.service.StrategyService;
import cn.bootx.sales.dto.strategy.StrategyConfigDto;
import cn.bootx.sales.dto.strategy.StrategyDto;
import cn.bootx.sales.param.strategy.StrategyParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author xxm
 * @date 2020/10/17
 */
@Tag(name ="策略定义")
@RestController
@RequestMapping("/strategy")
@AllArgsConstructor
public class StrategyController {
    private final StrategyService strategyService;

    @Operation(summary = "添加策略")
    @PostMapping("/add")
    public ResResult<Void> add(@RequestBody StrategyParam param){
        strategyService.add(param);
        return Res.ok();
    }

    @Operation(summary = "更新策略")
    @PostMapping("/update")
    public ResResult<StrategyDto> update(@RequestBody StrategyParam param){
        return Res.ok(strategyService.update(param));
    }

    @Operation(summary = "查询全部策略")
    @GetMapping("/findAll")
    public ResResult<List<StrategyDto>> findAll(){
        return Res.ok(strategyService.findAll());
    }

    @Operation(summary = "获取策略及其配置项")
    @GetMapping("/findById")
    public ResResult<StrategyDto> findById(Long id){
        return Res.ok(strategyService.findById(id));
    }

    @Operation(summary = "获取参数配置")
    @GetMapping("/findConfigs")
    public ResResult<List<StrategyConfigDto>> findConfigs(Long id){
        return Res.ok(strategyService.findConfigsByStrategyId(id));
    }

    @Operation(summary = "根据类型查询")
    @GetMapping("/findByType")
    public ResResult<List<StrategyConfigDto>> findByType(Integer type){
        return Res.ok(strategyService.findByType(type));
    }

}

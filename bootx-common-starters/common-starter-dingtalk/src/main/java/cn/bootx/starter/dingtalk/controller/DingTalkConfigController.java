package cn.bootx.starter.dingtalk.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.dingtalk.core.config.service.DingTalkConfigService;
import cn.bootx.starter.dingtalk.dto.config.DingTalkConfigDto;
import cn.bootx.starter.dingtalk.param.config.DingTalkConfigParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* 钉钉配置
* @author xxm
* @date 2022/4/3
*/
@Tag(name = "钉钉配置")
@RestController
@RequestMapping("/ding/config")
@RequiredArgsConstructor
public class DingTalkConfigController {
    private final DingTalkConfigService dingTalkConfigService;

    @Operation(summary = "新增配置")
    @PostMapping("/add")
    public ResResult<DingTalkConfigDto> add(@RequestBody DingTalkConfigParam param){
        return Res.ok(dingTalkConfigService.add(param));
    }

    @Operation(summary = "修改配置")
    @PostMapping("/update")
    public ResResult<DingTalkConfigDto> update(@RequestBody DingTalkConfigParam param){
        return Res.ok(dingTalkConfigService.update(param));
    }

    @Operation(summary = "设置启用的配置")
    @PostMapping("/setEnable")
    public ResResult<Void> setEnable(Long id){
        dingTalkConfigService.setEnable(id);
        return Res.ok();
    }

    @Operation(summary = "清除启用状态")
    @PostMapping("/clearEnable")
    public ResResult<Void> clearEnable(Long id){
        dingTalkConfigService.clearEnable(id);
        return Res.ok();
    }

    @Operation(summary = "分页")
    @GetMapping("/page")
    public ResResult<PageResult<DingTalkConfigDto>> page(@ParameterObject PageParam pageParam, @ParameterObject DingTalkConfigParam param){
        return Res.ok(dingTalkConfigService.page(pageParam,param));
    }

    @Operation(summary = "查询全部")
    @GetMapping("/findAll")
    public ResResult<List<DingTalkConfigDto>> findAll(){
        return Res.ok(dingTalkConfigService.findAll());
    }


    @Operation(summary = "获取详情")
    @GetMapping("/findById")
    public ResResult<DingTalkConfigDto> findById(Long id){
        return Res.ok(dingTalkConfigService.findById(id));
    }

    @Operation(summary = "删除")
    @DeleteMapping("/delete")
    public ResResult<Void> delete(Long id){
        dingTalkConfigService.delete(id);
        return Res.ok();
    }
}

package cn.bootx.platform.baseapi.controller;

import cn.bootx.platform.baseapi.core.chinaword.service.ChinaWordService;
import cn.bootx.platform.baseapi.dto.chinaword.ChinaWordDto;
import cn.bootx.platform.baseapi.param.chinaword.ChinaWordParam;
import cn.bootx.platform.common.core.rest.PageResult;
import cn.bootx.platform.common.core.rest.Res;
import cn.bootx.platform.common.core.rest.ResResult;
import cn.bootx.platform.common.core.rest.param.PageParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 敏感词
 * @author xxm
 * @since 2023-08-09
 */
@Tag(name ="敏感词管理")
@RestController
@RequestMapping("/chinaword")
@RequiredArgsConstructor
public class ChinaWordController {
    private final ChinaWordService chinaWordService;

    @Operation( summary = "添加")
    @PostMapping(value = "/add")
    public ResResult<Void> add(@RequestBody ChinaWordParam param){
        chinaWordService.add(param);
        return Res.ok();
    }

    @Operation( summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<Void> update(@RequestBody ChinaWordParam param){
        chinaWordService.update(param);
        return Res.ok();
    }

    @Operation( summary = "删除")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id){
        chinaWordService.delete(id);
        return Res.ok();
    }


    @Operation( summary = "添加")
    @PostMapping(value = "/verify")
    public ResResult<Void> verify(@RequestBody ChinaWordParam param){
        chinaWordService.add(param);
        return Res.ok();
    }

    @Operation( summary = "通过ID查询")
    @GetMapping(value = "/findById")
    public ResResult<ChinaWordDto> findById(Long id){
        return Res.ok(chinaWordService.findById(id));
    }

    @Operation( summary = "刷新缓存")
    @PostMapping(value = "/refresh")
    public ResResult<ChinaWordDto> refresh(){
        chinaWordService.refresh();
        return Res.ok();
    }

    @Operation( summary = "查询所有")
    @GetMapping(value = "/findAll")
    public ResResult<List<ChinaWordDto>> findAll(){
        return Res.ok(chinaWordService.findAll());
    }

    @Operation( summary = "分页查询")
    @GetMapping(value = "/page")
    public ResResult<PageResult<ChinaWordDto>> page(PageParam pageParam, ChinaWordParam query){
        return Res.ok(chinaWordService.page(pageParam,query));
    }
}

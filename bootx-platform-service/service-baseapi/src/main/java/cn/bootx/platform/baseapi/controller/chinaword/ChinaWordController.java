package cn.bootx.platform.baseapi.controller.chinaword;

import cn.bootx.platform.baseapi.param.chinaword.ChinaWordParam;
import cn.bootx.platform.baseapi.result.chinaword.ChinaWordResult;
import cn.bootx.platform.baseapi.service.chinaword.ChinaWordService;
import cn.bootx.platform.core.rest.Res;
import cn.bootx.platform.core.rest.param.PageParam;
import cn.bootx.platform.core.rest.result.PageResult;
import cn.bootx.platform.core.rest.result.Result;
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
    public Result<Void> add(@RequestBody ChinaWordParam param){
        chinaWordService.add(param);
        return Res.ok();
    }

    @Operation( summary = "修改")
    @PostMapping(value = "/update")
    public Result<Void> update(@RequestBody ChinaWordParam param){
        chinaWordService.update(param);
        return Res.ok();
    }

    @Operation( summary = "删除")
    @DeleteMapping(value = "/delete")
    public Result<Void> delete(Long id){
        chinaWordService.delete(id);
        return Res.ok();
    }


    @Operation( summary = "添加")
    @PostMapping(value = "/verify")
    public Result<Void> verify(@RequestBody ChinaWordParam param){
        chinaWordService.add(param);
        return Res.ok();
    }

    @Operation( summary = "通过ID查询")
    @GetMapping(value = "/findById")
    public Result<ChinaWordResult> findById(Long id){
        return Res.ok(chinaWordService.findById(id));
    }

    @Operation( summary = "刷新缓存")
    @PostMapping(value = "/refresh")
    public Result<ChinaWordResult> refresh(){
        chinaWordService.refresh();
        return Res.ok();
    }

    @Operation( summary = "查询所有")
    @GetMapping(value = "/findAll")
    public Result<List<ChinaWordResult>> findAll(){
        return Res.ok(chinaWordService.findAll());
    }

    @Operation( summary = "分页查询")
    @GetMapping(value = "/page")
    public Result<PageResult<ChinaWordResult>> page(PageParam pageParam, ChinaWordParam query){
        return Res.ok(chinaWordService.page(pageParam,query));
    }
}


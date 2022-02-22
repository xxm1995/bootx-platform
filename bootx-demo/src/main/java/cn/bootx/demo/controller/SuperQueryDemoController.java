package cn.bootx.demo.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.query.entity.QueryParams;
import cn.bootx.demo.core.query.entity.SuperQueryDemo;
import cn.bootx.demo.core.query.service.SuperQueryDemoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
*
* @author xxm
* @date 2022/2/21
*/
@Tag(name = "超级查询演示")
@RestController
@RequestMapping("/demo/super/query")
@RequiredArgsConstructor
public class SuperQueryDemoController {
    private final SuperQueryDemoService superQueryDemoService;

    @Operation( summary = "添加")
    @PostMapping(value = "/add")
    public ResResult<Void> add(@RequestBody SuperQueryDemo param){
        superQueryDemoService.add(param);
        return Res.ok();
    }

    @Operation( summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<Void> update(@RequestBody SuperQueryDemo param){
        superQueryDemoService.update(param);
        return Res.ok();
    }

    @Operation( summary = "删除")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id){
        superQueryDemoService.delete(id);
        return Res.ok();
    }

    @Operation( summary = "通过ID查询")
    @GetMapping(value = "/findById")
    public ResResult<SuperQueryDemo> findById(Long id){
        return Res.ok(superQueryDemoService.findById(id));
    }

    @Operation( summary = "分页查询")
    @GetMapping(value = "/page")
    public ResResult<PageResult<SuperQueryDemo>> page(PageParam pageParam){
        return Res.ok(superQueryDemoService.page(pageParam));
    }

    @Operation( summary = "超级查询(分页)")
    @PostMapping(value = "/superQuery")
    public ResResult<PageResult<SuperQueryDemo>> superQuery(PageParam pageParam, @RequestBody QueryParams queryParams){
        return Res.ok(superQueryDemoService.superQuery(pageParam,queryParams));
    }
}

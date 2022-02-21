package cn.bootx.demo.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.demo.core.perm.entity.DataPermDemo;
import cn.bootx.demo.core.perm.service.DataPermDemoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
* 数据权限演示
* @author xxm
* @date 2022/2/21
*/
@Tag(name = "数据权限演示")
@RestController
@RequestMapping("/demo/data/perm")
@RequiredArgsConstructor
public class DataPermDemoController {
    private final DataPermDemoService dataPermDemoService;

    @Operation( summary = "添加")
    @PostMapping(value = "/add")
    public ResResult<Void> add(@RequestBody DataPermDemo param){
        dataPermDemoService.add(param);
        return Res.ok();
    }

    @Operation( summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<Void> update(@RequestBody DataPermDemo param){
        dataPermDemoService.update(param);
        return Res.ok();
    }

    @Operation( summary = "删除")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id){
        dataPermDemoService.delete(id);
        return Res.ok();
    }

    @Operation( summary = "通过ID查询")
    @GetMapping(value = "/findById")
    public ResResult<DataPermDemo> findById(Long id){
        return Res.ok(dataPermDemoService.findById(id));
    }

    @Operation( summary = "分页查询")
    @GetMapping(value = "/page")
    public ResResult<PageResult<DataPermDemo>> page(PageParam pageParam){
        return Res.ok(dataPermDemoService.page(pageParam));
    }

}

package cn.bootx.baseapi.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.baseapi.core.dynamicsource.service.DynamicDataSourceService;
import cn.bootx.baseapi.dto.dynamicsource.DynamicDataSourceDto;
import cn.bootx.baseapi.param.dynamicsource.DynamicDataSourceParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 动态数据源管理
 * @author xxm
 * @date 2022-09-24
 */
@Tag(name ="动态数据源管理")
@RestController
@RequestMapping("/dynamic/source")
@RequiredArgsConstructor
public class DynamicDataSourceController {
    private final DynamicDataSourceService dynamicDataSourceService;

    @Operation( summary = "添加")
    @PostMapping(value = "/add")
    public ResResult<Void> add(@RequestBody DynamicDataSourceParam param){
        dynamicDataSourceService.add(param);
        return Res.ok();
    }

    @Operation( summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<Void> update(@RequestBody DynamicDataSourceParam param){
        dynamicDataSourceService.update(param);
        return Res.ok();
    }

    @Operation( summary = "删除")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id){
        dynamicDataSourceService.delete(id);
        return Res.ok();
    }

    @Operation( summary = "通过ID查询")
    @GetMapping(value = "/findById")
    public ResResult<DynamicDataSourceDto> findById(Long id){
        return Res.ok(dynamicDataSourceService.findById(id));
    }

    @Operation( summary = "查询所有")
    @GetMapping(value = "/findAll")
    public ResResult<List<DynamicDataSourceDto>> findAll(){
        return Res.ok(dynamicDataSourceService.findAll());
    }

    @Operation( summary = "测试连接")
    @PostMapping(value = "/testConnection")
    public ResResult<String> testConnection(@RequestBody DynamicDataSourceParam param){
        return Res.ok(dynamicDataSourceService.testConnection(param));
    }

    @Operation( summary = "分页查询")
    @GetMapping(value = "/page")
    public ResResult<PageResult<DynamicDataSourceDto>> page(PageParam pageParam, DynamicDataSourceParam dynamicDataSourceParam){
        return Res.ok(dynamicDataSourceService.page(pageParam,dynamicDataSourceParam));
    }
}

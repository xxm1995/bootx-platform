package cn.bootx.platform.demo.controller.data;

import cn.bootx.platform.common.core.rest.PageResult;
import cn.bootx.platform.common.core.rest.Res;
import cn.bootx.platform.common.core.rest.ResResult;
import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.demo.core.sensitive.entity.DataSensitiveDemo;
import cn.bootx.platform.demo.core.sensitive.service.DataSensitiveDemoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * 数据脱敏演示
 *
 * @author xxm
 * @date 2022/3/24
 */
@Tag(name = "数据脱敏演示")
@RestController
@RequestMapping("/demo/data/sensitive")
@RequiredArgsConstructor
public class DataSensitiveDemoController {

    private final DataSensitiveDemoService service;

    @Operation(summary = "添加")
    @PostMapping(value = "/add")
    public ResResult<Void> add(@RequestBody DataSensitiveDemo param) {
        service.add(param);
        return Res.ok();
    }

    @Operation(summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<Void> update(@RequestBody DataSensitiveDemo param) {
        service.update(param);
        return Res.ok();
    }

    @Operation(summary = "删除")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id) {
        service.delete(id);
        return Res.ok();
    }

    @Operation(summary = "通过ID查询")
    @GetMapping(value = "/findById")
    public ResResult<DataSensitiveDemo> findById(Long id) {
        return Res.ok(service.findById(id));
    }

    @Operation(summary = "分页查询")
    @GetMapping(value = "/page")
    public ResResult<PageResult<DataSensitiveDemo>> page(PageParam pageParam) {
        return Res.ok(service.page(pageParam));
    }

}

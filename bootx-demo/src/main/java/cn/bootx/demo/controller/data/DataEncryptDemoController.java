package cn.bootx.demo.controller.data;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.demo.core.encrypt.entity.DataEncryptDemo;
import cn.bootx.demo.core.encrypt.service.DataEncryptDemoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author xxm
 * @date 2022/3/24
 */
@Tag(name = "数据加密解密演示")
@RestController
@RequestMapping("/demo/data/encrypt")
@RequiredArgsConstructor
public class DataEncryptDemoController {

    private final DataEncryptDemoService service;

    @Operation(summary = "添加")
    @PostMapping(value = "/add")
    public ResResult<Void> add(@RequestBody DataEncryptDemo param) {
        service.add(param);
        return Res.ok();
    }

    @Operation(summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<Void> update(@RequestBody DataEncryptDemo param) {
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
    public ResResult<DataEncryptDemo> findById(Long id) {
        return Res.ok(service.findById(id));
    }

    @Operation(summary = "分页查询")
    @GetMapping(value = "/page")
    public ResResult<PageResult<DataEncryptDemo>> page(PageParam pageParam) {
        return Res.ok(service.page(pageParam));
    }

}

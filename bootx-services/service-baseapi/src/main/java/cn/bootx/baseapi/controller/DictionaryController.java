package cn.bootx.baseapi.controller;

import cn.bootx.baseapi.core.dict.service.DictionaryService;
import cn.bootx.baseapi.dto.dict.DictionaryDto;
import cn.bootx.baseapi.param.dict.DictionaryParam;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 字典
 * @author xxm
 * @date 2021/8/4
 */
@Tag(name ="字典")
@RestController
@RequestMapping("/dict")
@RequiredArgsConstructor
public class DictionaryController {
    private final DictionaryService dictionaryService;

    @Operation(summary = "添加")
    @PostMapping("/add")
    public ResResult<DictionaryDto> add(@RequestBody DictionaryParam param) {
        return Res.ok(dictionaryService.add(param));
    }

    @Operation(summary = "根据id删除")
    @DeleteMapping("/delete")
    public ResResult<Boolean> delete(Long id) {
        dictionaryService.delete(id);
        return Res.ok();
    }

    @Operation(summary = "更新")
    @PostMapping("/update")
    public ResResult<DictionaryDto> update(@RequestBody DictionaryParam param) {
        return Res.ok(dictionaryService.update(param));
    }

    @Operation(summary = "根据id获取")
    @GetMapping("/findById")
    public ResResult<DictionaryDto> findById(Long id) {
        return Res.ok(dictionaryService.findById(id));
    }

    @Operation(summary = "查询全部")
    @GetMapping("/findAll")
    public ResResult<List<DictionaryDto>> findAll() {
        return Res.ok(dictionaryService.findAll());
    }

    @Operation(summary = "分页")
    @GetMapping("/page")
    public ResResult<PageResult<DictionaryDto>> page(PageParam pageParam,DictionaryParam param){
        return Res.ok(dictionaryService.page(pageParam,param));
    }

    @Operation( summary = "编码是否被使用")
    @GetMapping("/existsByCode")
    public ResResult<Boolean> existsByCode(String code) {
        return Res.ok(dictionaryService.existsByCode(code));
    }

    @Operation( summary = "编码是否被使用(不包含自己)")
    @GetMapping("/existsByCodeNotId")
    public ResResult<Boolean> existsByCode(String code,Long id) {
        return Res.ok(dictionaryService.existsByCode(code,id));
    }
}

package cn.bootx.baseapi.controller;

import cn.bootx.baseapi.core.dict.service.DictionaryService;
import cn.bootx.baseapi.dto.dict.DictionaryDto;
import cn.bootx.baseapi.param.dict.DictionaryParam;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 字典
 * @author xxm
 * @date 2021/8/4
 */
@Api(tags = "字典")
@RestController
@RequestMapping("/dict")
@RequiredArgsConstructor
public class DictionaryController {
    private final DictionaryService dictionaryService;

    @ApiOperation("添加")
    @PostMapping("/add")
    public ResResult<DictionaryDto> add(@RequestBody DictionaryParam param) {
        return Res.ok(dictionaryService.add(param));
    }

    @ApiOperation("根据id删除")
    @DeleteMapping("/delete")
    public ResResult<Boolean> delete(Long id) {
        dictionaryService.delete(id);
        return Res.ok();
    }

    @ApiOperation("更新")
    @PostMapping("/update")
    public ResResult<DictionaryDto> update(@RequestBody DictionaryParam param) {
        return Res.ok(dictionaryService.update(param));
    }

    @ApiOperation("根据id获取")
    @GetMapping("/findById")
    public ResResult<DictionaryDto> findById(Long id) {
        return Res.ok(dictionaryService.findById(id));
    }

    @ApiOperation("查询全部")
    @GetMapping("/findAll")
    public ResResult<List<DictionaryDto>> findAll() {
        return Res.ok(dictionaryService.findAll());
    }

    @ApiOperation("分页")
    @GetMapping("/page")
    public ResResult<PageResult<DictionaryDto>> page(PageParam pageParam,DictionaryParam param){
        return Res.ok(dictionaryService.page(pageParam,param));
    }

}

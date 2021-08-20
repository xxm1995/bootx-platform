package cn.bootx.baseapi.controller;

import cn.bootx.baseapi.core.dict.service.DictionaryItemService;
import cn.bootx.baseapi.dto.dict.DictionaryItemDto;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

/**
*
* @author xxm
* @date 2021/8/12
*/
@Api(tags = "兼容原始脚手架的一些请求")
@RestController("baseapiBaseBootController")
@RequiredArgsConstructor
public class BaseBootController {
    private final DictionaryItemService dictionaryItemService;

    /**
     * 根据字典code获取字段想列表
     */
    @ApiOperation("根据字典code获取字段想列表")
    @GetMapping("/sys/dict/type/{dictCode}")
    public ResResult<List<HashMap<String, String>>> findByDictCode(@PathVariable String dictCode){
        List<DictionaryItemDto> dictionaryItemDtos = dictionaryItemService.findByDictCode(dictCode);
        List<HashMap<String, String>> collect = dictionaryItemDtos.stream()
                .map(item -> {
                    HashMap<String, String> hashMap = new HashMap<>(2);
                    hashMap.put("value", item.getCode());
                    hashMap.put("label", item.getName());
                    return hashMap;
                }).collect(Collectors.toList());
        return Res.ok(collect);
    }
}

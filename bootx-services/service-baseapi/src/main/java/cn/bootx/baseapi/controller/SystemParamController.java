package cn.bootx.baseapi.controller;

import cn.bootx.baseapi.core.config.service.SystemParamService;
import cn.bootx.baseapi.dto.system.SystemParameterDto;
import cn.bootx.baseapi.param.system.SystemParameterParam;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**   
* 系统参数
* @author xxm  
* @date 2021/10/25 
*/
@Api(tags = "系统参数")
@RestController
@RequestMapping("/system/param")
@RequiredArgsConstructor
public class SystemParamController {
    private final SystemParamService systemParamService;

    @ApiOperation("添加")
    @PostMapping("/add")
    public ResResult<Void> add(@RequestBody SystemParameterParam param){
        systemParamService.add(param);
        return Res.ok();
    }
    @ApiOperation("更新")
    @PostMapping("/update")
    public ResResult<Void> update(SystemParameterParam param){
        systemParamService.update(param);
        return Res.ok();
    }

    @ApiOperation("分页")
    @GetMapping("/page")
    public ResResult<PageResult<SystemParameterDto>> page(PageParam pageParam, SystemParameterParam param){
        return Res.ok(systemParamService.page(pageParam,param));
    }

    @ApiOperation("获取单条")
    @GetMapping("/findById")
    public ResResult<SystemParameterDto> findById(Long id){
        return Res.ok(systemParamService.findById(id));
    }

    @ApiOperation("删除")
    @DeleteMapping("/delete")
    public ResResult<Void> delete(Long id){
        systemParamService.delete(id);
        return Res.ok();
    }
    
    @ApiOperation("判断编码是否存在")
    @GetMapping("/existsByKey")
    public ResResult<Boolean> existsByKey(String key){
        return Res.ok(systemParamService.existsByKey(key));
    }

    @ApiOperation("判断编码是否存在(不包含自己)")
    @GetMapping("/existsByKeyNotId")
    public ResResult<Boolean> existsByKeyNotId(String key,Long id){
        return Res.ok(systemParamService.existsByKey(key,id));
    }
}

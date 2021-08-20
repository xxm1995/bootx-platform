package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.iam.core.depart.service.DepartService;
import cn.bootx.iam.dto.depart.DepartDto;
import cn.bootx.iam.dto.depart.DepartTreeResult;
import cn.bootx.iam.param.depart.DepartParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* @author xxm
* @date 2020/5/10
*/
@Api(tags = "部门管理")
@RestController
@RequestMapping("/depart")
@AllArgsConstructor
public class DepartController {
    private final DepartService departService;

    @ApiOperation("添加")
    @PostMapping("/add")
    public ResResult<DepartDto> add(@RequestBody DepartParam param){
        return Res.ok(departService.add(param));
    }

    @ApiOperation("获取")
    @GetMapping("/get")
    ResResult<DepartDto> get(Long id){
        return Res.ok(departService.findById(id));
    }

    @ApiOperation("树状展示")
    @GetMapping("/tree")
    public ResResult<List<DepartTreeResult>> tree(){
       return Res.ok(departService.tree());
    }

    @ApiOperation("更新")
    @PostMapping("/update")
    public ResResult<DepartDto> update(@RequestBody DepartParam param){
        return Res.ok(departService.update(param));
    }

    @ApiOperation("普通删除")
    @DeleteMapping("/remove")
    public ResResult<Void> remove(Long id){
        departService.delete(id);
        return Res.ok();
    }

    @ApiOperation("强制级联删除")
    @DeleteMapping("/removeAndChildren")
    public ResResult<Boolean> removeAndChildren(Long id){
        return Res.ok(departService.deleteAndChildren(id));
    }
}

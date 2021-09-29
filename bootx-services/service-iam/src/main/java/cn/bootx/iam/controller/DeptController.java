package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.iam.core.dept.service.DeptService;
import cn.bootx.iam.dto.dept.DeptDto;
import cn.bootx.iam.dto.dept.DeptTreeResult;
import cn.bootx.iam.param.dept.DeptParam;
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
@RequestMapping("/dept")
@AllArgsConstructor
public class DeptController {
    private final DeptService deptService;

    @ApiOperation("添加")
    @PostMapping("/add")
    public ResResult<DeptDto> add(@RequestBody DeptParam param){
        return Res.ok(deptService.add(param));
    }

    @ApiOperation("获取")
    @GetMapping("/get")
    ResResult<DeptDto> get(Long id){
        return Res.ok(deptService.findById(id));
    }

    @ApiOperation("树状展示")
    @GetMapping("/tree")
    public ResResult<List<DeptTreeResult>> tree(){
       return Res.ok(deptService.tree());
    }

    @ApiOperation("更新")
    @PostMapping("/update")
    public ResResult<DeptDto> update(@RequestBody DeptParam param){
        return Res.ok(deptService.update(param));
    }

    @ApiOperation("普通删除")
    @DeleteMapping("/remove")
    public ResResult<Void> remove(Long id){
        deptService.delete(id);
        return Res.ok();
    }

    @ApiOperation("强制级联删除")
    @DeleteMapping("/removeAndChildren")
    public ResResult<Boolean> removeAndChildren(Long id){
        return Res.ok(deptService.deleteAndChildren(id));
    }
}

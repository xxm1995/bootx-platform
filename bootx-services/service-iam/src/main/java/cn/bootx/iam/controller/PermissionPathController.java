package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.iam.core.permission.service.PermissionPathService;
import cn.bootx.iam.dto.permission.PermissionPathDto;
import cn.bootx.iam.param.permission.PermissionPathParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* @author xxm
* @date 2020/5/11 9:36
*/
@Api(tags = "请求权限资源")
@RestController
@RequestMapping("/permission/path")
@RequiredArgsConstructor
public class PermissionPathController {
    private final PermissionPathService pathService;

    @ApiOperation("添加权限")
    @PostMapping("/add")
    public ResResult<PermissionPathDto> add(@RequestBody PermissionPathParam param){
        return Res.ok(pathService.add(param));
    }

    @ApiOperation("更新权限")
    @PostMapping("/update")
    public ResResult<PermissionPathDto> update(@RequestBody PermissionPathParam param){
        return Res.ok(pathService.update(param));
    }

    @ApiOperation("删除权限")
    @PostMapping("/delete")
    public ResResult<Void> delete(Long id){
        pathService.delete(id);
        return Res.ok();
    }

    @ApiOperation("获取详情")
    @GetMapping("/findById")
    public ResResult<PermissionPathDto> findById(Long id){
        return Res.ok(pathService.findById(id));
    }

    @ApiOperation("权限分页")
    @GetMapping("/page")
    public ResResult<PageResult<PermissionPathDto>> page(PageParam pageParam,PermissionPathParam param){
        return Res.ok(pathService.page(pageParam,param));
    }

    @ApiOperation("权限列表")
    @GetMapping("/findAll")
    public ResResult<List<PermissionPathDto>> findAll(){
        return Res.ok(pathService.findAll());
    }



}

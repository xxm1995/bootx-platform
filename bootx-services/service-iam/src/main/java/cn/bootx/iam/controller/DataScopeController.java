package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.iam.core.scope.service.DataScopeService;
import cn.bootx.iam.core.scope.service.DataScopeUserService;
import cn.bootx.iam.dto.scope.DataScopeDto;
import cn.bootx.iam.dto.scope.DataScopeUserInfoDto;
import cn.bootx.iam.param.scope.DataScopeDeptParam;
import cn.bootx.iam.param.scope.DataScopeParam;
import cn.bootx.iam.param.scope.DataScopeUserParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author xxm
 * @date 2021/12/23
 */
@Tag(name = "数据范围权限配置")
@RestController
@RequestMapping("/data/scope")
@RequiredArgsConstructor
public class DataScopeController {

    private final DataScopeService dataScopeService;

    private final DataScopeUserService dataScopeUserService;

    @Operation(summary = "添加")
    @PostMapping("/add")
    public ResResult<Void> add(@RequestBody DataScopeParam param) {
        dataScopeService.add(param);
        return Res.ok();
    }

    @Operation(summary = "更新")
    @PostMapping("/update")
    public ResResult<Void> update(@RequestBody DataScopeParam param) {
        dataScopeService.update(param);
        return Res.ok();
    }

    @Operation(summary = "删除")
    @DeleteMapping("/delete")
    public ResResult<Void> delete(Long id) {
        dataScopeService.delete(id);
        return Res.ok();
    }

    @Operation(summary = "保存关联部门")
    @PostMapping("/saveDeptAssign")
    public ResResult<Void> saveDeptAssign(@RequestBody DataScopeDeptParam param) {
        dataScopeService.saveDeptAssign(param);
        return Res.ok();
    }

    @Operation(summary = "获取关联部门id")
    @GetMapping("/getDeptIds")
    public ResResult<List<Long>> getDeptIds(Long id) {
        return Res.ok(dataScopeService.findDeptIds(id));
    }

    @Operation(summary = "编码是否被使用")
    @GetMapping("/existsByCode")
    public ResResult<Boolean> existsByCode(String code) {
        return Res.ok(dataScopeService.existsByCode(code));
    }

    @Operation(summary = "编码是否被使用(不包含自己)")
    @GetMapping("/existsByCodeNotId")
    public ResResult<Boolean> existsByCode(String code, Long id) {
        return Res.ok(dataScopeService.existsByCode(code, id));
    }

    @Operation(summary = "名称是否被使用")
    @GetMapping("/existsByName")
    public ResResult<Boolean> existsByName(String name) {
        return Res.ok(dataScopeService.existsByName(name));
    }

    @Operation(summary = "名称是否被使用(不包含自己)")
    @GetMapping("/existsByNameNotId")
    public ResResult<Boolean> existsByName(String name, Long id) {
        return Res.ok(dataScopeService.existsByName(name, id));
    }

    @Operation(summary = "获取")
    @GetMapping("/findById")
    public ResResult<DataScopeDto> findById(Long id) {
        return Res.ok(dataScopeService.findById(id));
    }

    @Operation(summary = "分页")
    @GetMapping("/page")
    public ResResult<PageResult<DataScopeDto>> page(@ParameterObject PageParam pageParam,
            @ParameterObject DataScopeParam param) {
        return Res.ok(dataScopeService.page(pageParam, param));
    }

    @Operation(summary = "查询全部")
    @GetMapping("/findAll")
    public ResResult<List<DataScopeDto>> findAll() {
        return Res.ok(dataScopeService.findAll());
    }

    @Operation(summary = "获取关联的用户列表")
    @GetMapping("/findUsersByDataScopeId")
    public ResResult<List<DataScopeUserInfoDto>> findUsersByDataScopeId(Long id) {
        return Res.ok(dataScopeUserService.findUsersByDataScopeId(id));
    }

    @Operation(summary = "保存关联用户权限")
    @PostMapping("/saveUserAssign")
    public ResResult<Void> saveUserAssign(@RequestBody DataScopeUserParam param) {
        dataScopeUserService.saveUserAssign(param.getDataScopeId(), param.getUserIds());
        return Res.ok();
    }

    @Operation(summary = "批量删除关联用户")
    @DeleteMapping("/deleteUserAssigns")
    public ResResult<Void> deleteUserAssigns(@RequestBody List<Long> ids) {
        dataScopeUserService.deleteBatch(ids);
        return Res.ok();
    }

}

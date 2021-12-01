package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.dto.KeyValue;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ValidationUtil;
import cn.bootx.iam.core.upms.service.RoleService;
import cn.bootx.iam.dto.upms.RoleDto;
import cn.bootx.iam.param.upms.RoleParam;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* @author xxm
* @date 2021/6/9
*/
@Tag(name ="角色管理")
@RestController
@RequestMapping("/role")
@RequiredArgsConstructor
public class RoleController {
    private final RoleService roleService;

    @Parameter(name = "添加角色（返回角色对象）")
    @PostMapping(value = "/add")
    public ResResult<RoleDto> add(@RequestBody RoleParam roleParam){
        ValidationUtil.validateParam(roleParam);
        RoleDto result = roleService.add(roleParam);
        return Res.ok(result);
    }

    @Parameter(name = "删除角色")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id){
        roleService.delete(id);
        return Res.ok();
    }

    @Parameter(name = "修改角色（返回角色对象）")
    @PostMapping(value = "/update")
    public ResResult<RoleDto> update(@RequestBody RoleParam roleParam){
        ValidationUtil.validateParam(roleParam);
        RoleDto result = roleService.update(roleParam);
        return Res.ok(result);
    }

    @Parameter(name = "通过ID查询角色")
    @GetMapping(value = "/findById")
    public ResResult<RoleDto> findById(Long id){
        return Res.ok(roleService.findById(id));
    }

    @Parameter(name = "查询所有的角色")
    @GetMapping(value = "/findAll")
    public ResResult<List<RoleDto>> findAll(){
        return Res.ok(roleService.findAll());
    }

    @Parameter(name = "角色下拉框")
    @GetMapping(value = "/dropdown")
    public ResResult<List<KeyValue>> dropdown(){
        return Res.ok(roleService.dropdown());
    }

    @Parameter(name = "分页查询角色")
    @GetMapping(value = "/page")
    public ResResult<PageResult<RoleDto>> page(PageParam pageParam, RoleParam roleParam){
        return Res.ok(roleService.page(pageParam));
    }

    @Parameter(name = "编码是否被使用")
    @GetMapping("/existsByCode")
    public ResResult<Boolean> existsByCode(String code) {
        return Res.ok(roleService.existsByCode(code));
    }

    @Parameter(name = "编码是否被使用(不包含自己)")
    @GetMapping("/existsByCodeNotId")
    public ResResult<Boolean> existsByCode(String code,Long id) {
        return Res.ok(roleService.existsByCode(code,id));
    }

    @Parameter(name = "名称是否被使用")
    @GetMapping("/existsByName")
    public ResResult<Boolean> existsByName(String name) {
        return Res.ok(roleService.existsByName(name));
    }

    @Parameter(name = "名称是否被使用(不包含自己)")
    @GetMapping("/existsByNameNotId")
    public ResResult<Boolean> existsByName(String name,Long id) {
        return Res.ok(roleService.existsByName(name,id));
    }
}

package cn.bootx.platform.visualization.controller;

import cn.bootx.platform.common.core.rest.PageResult;
import cn.bootx.platform.common.core.rest.Res;
import cn.bootx.platform.common.core.rest.ResResult;
import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.visualization.core.service.ProjectInfoService;
import cn.bootx.platform.visualization.dto.ProjectInfoDto;
import cn.bootx.platform.visualization.dto.ProjectInfoResult;
import cn.bootx.platform.visualization.param.CreateParam;
import cn.bootx.platform.visualization.param.ProjectInfoParam;
import cn.bootx.platform.visualization.param.ProjectInfoSave;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * GoView可视化大屏管理接口
 *
 * @author xxm
 * @since 2023/2/24
 */
@Validated
@Tag(name = "GoView可视化大屏管理接口")
@RestController
@RequestMapping("/goview/admin")
@RequiredArgsConstructor
public class GoViewAdminController {

    private final ProjectInfoService projectInfoService;

    @Operation(summary = "创建项目")
    @PostMapping("/add")
    public ResResult<ProjectInfoResult> add(@Valid @RequestBody CreateParam param) {
        return Res.ok(projectInfoService.create(param));
    }

    @Operation(summary = "获取项目列表分页 ")
    @GetMapping("/page")
    public ResResult<PageResult<ProjectInfoDto>> page(PageParam pageParam, ProjectInfoSave query) {
        return Res.ok(projectInfoService.pageByAdmin(pageParam, query));
    }

    @Operation(summary = "获取详情")
    @GetMapping("/findById")
    public ResResult<ProjectInfoDto> findById(Long id) {
        return Res.ok(projectInfoService.findById(id));
    }

    @Operation(summary = "更新数据")
    @PostMapping("/update")
    public ResResult<Void> update(@RequestBody ProjectInfoParam param) {
        projectInfoService.updateByAdmin(param);
        return Res.ok();
    }

    @Operation(summary = "复制")
    @PostMapping("/copy")
    public ResResult<Void> copy(Long id) {
        projectInfoService.copy(id);
        return Res.ok();
    }

    @Operation(summary = "发布")
    @PostMapping("/publish")
    public ResResult<Void> publish(Long id) {
        projectInfoService.publish(id);
        return Res.ok();
    }

    @Operation(summary = "取消发布")
    @PostMapping("/unPublish")
    public ResResult<Void> unPublish(Long id) {
        projectInfoService.unPublish(id);
        return Res.ok();
    }

    @Operation(summary = "应用编辑中的信息")
    @PostMapping("/enableEditContent")
    public ResResult<Void> enableEditContent(Long id) {
        projectInfoService.enableEditContent(id);
        return Res.ok();
    }

    @Operation(summary = "重置编辑中的信息")
    @PostMapping("/resetEditContent")
    public ResResult<Void> resetEditContent(Long id) {
        projectInfoService.resetEditContent(id);
        return Res.ok();
    }

    @Operation(summary = "获取GoView服务的地址")
    @GetMapping("/getGoViewUrl")
    public ResResult<String> getGoViewUrl() {
        return Res.ok(projectInfoService.getGoViewUrl());
    }

    @Operation(summary = "删除")
    @DeleteMapping("/delete")
    public ResResult<Void> delete(Long id) {
        projectInfoService.delete(id);
        return Res.ok();
    }

}

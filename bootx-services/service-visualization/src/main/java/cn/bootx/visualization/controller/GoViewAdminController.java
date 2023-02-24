package cn.bootx.visualization.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.visualization.core.service.ProjectInfoService;
import cn.bootx.visualization.dto.GoVIewPageResult;
import cn.bootx.visualization.dto.ProjectInfoDto;
import cn.bootx.visualization.dto.ProjectInfoResult;
import cn.bootx.visualization.param.CreateParam;
import cn.bootx.visualization.param.ProjectInfoSave;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * GoView可视化大屏管理接口
 * @author xxm
 * @date 2023/2/24
 */
@Validated
@Tag(name = "GoView可视化大屏管理接口")
@RestController
@RequestMapping("/goview/admin")
@RequiredArgsConstructor
public class GoViewAdminController {
    private final ProjectInfoService projectInfoService;

    @Operation(summary = "创建项目")
    @PostMapping("/create")
    public ResResult<ProjectInfoResult> create(@Valid @RequestBody CreateParam param) {
        return Res.ok(projectInfoService.create(param));
    }

    @Operation(summary = "获取项目列表分页 ")
    @GetMapping("/page")
    public ResResult<PageResult<ProjectInfoDto>> page(PageParam pageParam, ProjectInfoSave query){
        return Res.ok(projectInfoService.pageByAdmin(pageParam,query));
    }

    @Operation(summary = "更新数据")
    @PostMapping("/update")
    public ResResult<Void> update(@RequestBody ProjectInfoSave param) {
        projectInfoService.update(param);
        return Res.ok();
    }

    @Operation(summary = "发布发布")
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

    @Operation(summary = "将发布中的数据更新为正在编辑中的信息")
    @PostMapping("/enableEditContent")
    public ResResult<Void> enableEditContent(Long id) {
        projectInfoService.enableEditContent(id);
        return Res.ok();
    }

    @Operation(summary = "删除")
    @DeleteMapping("/delete")
    public ResResult<Void> delete(Long ids) {
        return Res.ok();
    }
}

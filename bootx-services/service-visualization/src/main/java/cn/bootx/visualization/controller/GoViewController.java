package cn.bootx.visualization.controller;

import cn.bootx.common.core.annotation.IgnoreAuth;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.visualization.core.service.ProjectInfoService;
import cn.bootx.visualization.dto.OssInfo;
import cn.bootx.visualization.dto.GoVIewPageResult;
import cn.bootx.visualization.dto.ProjectInfoResult;
import cn.bootx.visualization.param.ProjectInfoSave;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * GoView可视化大屏对接接口
 * @author xxm
 * @date 2023/2/21
 */
@Validated
@Tag(name = "GoView可视化大屏对接接口")
@RestController
@RequestMapping("/goview")
@RequiredArgsConstructor
public class GoViewController {
    private final ProjectInfoService projectInfoService;

    @IgnoreAuth
    @Operation(summary = "获取文件oss存储信息")
    @GetMapping("/getOssInfo")
    public ResResult<OssInfo> getOssInfo(){
        return Res.ok(projectInfoService.getOssInfo());
    }
    @Operation(summary = "获取项目列表分页 ")
    @GetMapping("/page")
    public GoVIewPageResult<List<ProjectInfoResult>> page(Integer page, Integer limit){
        return projectInfoService.pageByGoVIew(page,limit);
    }

    @IgnoreAuth
    @Operation(summary = "获取发布的数据(报表内容为空返回null)")
    @GetMapping("/getPublishData")
    public ResResult<ProjectInfoResult> getPublishData(Long projectId) {
        return Res.ok(projectInfoService.getPublishData(projectId));
    }

    @Operation(summary = "获取编辑时的数据(报表内容为空返回null)")
    @GetMapping("/getEditData")
    public ResResult<ProjectInfoResult> getEditData(Long projectId) {
        return Res.ok(projectInfoService.getEditData(projectId));
    }

    @Operation(summary = "更新数据")
    @PostMapping("/update")
    public ResResult<Void> update(@RequestBody ProjectInfoSave param) {
        projectInfoService.update(param);
        return Res.ok();
    }
}

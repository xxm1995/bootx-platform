package cn.bootx.visualization.controller;

import cn.bootx.common.core.annotation.IgnoreAuth;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.visualization.core.service.ProjectInfoService;
import cn.bootx.visualization.dto.OssInfo;
import cn.bootx.visualization.dto.PageResult;
import cn.bootx.visualization.dto.ProjectInfoResult;
import cn.bootx.visualization.param.CreateParam;
import cn.bootx.visualization.param.ProjectInfoParam;
import cn.bootx.visualization.param.PublishParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
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


    @PostMapping("/create")
    @Operation(summary = "创建项目")
    public ResResult<ProjectInfoResult> create(@Valid @RequestBody CreateParam param) {
        return Res.ok(projectInfoService.create(param));
    }

    @IgnoreAuth
    @Operation(summary = "获取文件oss存储信息")
    @GetMapping("/getOssInfo")
    public ResResult<OssInfo> getOssInfo(){
        return Res.ok(projectInfoService.getOssInfo());
    }
    @Operation(summary = "获取项目列表分页 ")
    @GetMapping("/page")
    public PageResult<List<ProjectInfoResult>> page(Integer page, Integer limit){
        return projectInfoService.page(page,limit);
    }

    @IgnoreAuth
    @Operation(summary = "获取数据(报表内容为空返回null)")
    @GetMapping("/getData")
    public ResResult<ProjectInfoResult> getData(Long projectId) {
        return Res.ok(projectInfoService.getData(projectId));
    }

    @Operation(summary = "更新数据")
    @PostMapping("/update")
    public ResResult<Void> update(@RequestBody ProjectInfoParam param) {
        projectInfoService.update(param);
        return Res.ok();
    }

    @Operation(summary = "发布/取消发布")
    @PutMapping("/publish")
    public ResResult<Void> publish(@RequestBody PublishParam param) {
        projectInfoService.publish(param);
        return Res.ok();
    }

    @Operation(summary = "删除")
    @DeleteMapping("/delete")
    public ResResult<Void> delete(Long ids) {
        projectInfoService.delete(ids);
        return Res.ok();
    }

}

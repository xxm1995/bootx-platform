package cn.bootx.visualization.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.starter.file.configuration.FileUploadProperties;
import cn.bootx.visualization.dto.OssInfo;
import cn.bootx.visualization.dto.PageResult;
import cn.bootx.visualization.dto.ProjectInfoDto;
import cn.bootx.visualization.param.CreateProjectParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.util.IdUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    private final FileUploadProperties uploadProperties;


    @PostMapping("/create")
    @Operation(summary = "创建项目")
    public ResResult<ProjectInfoDto> createProject(@Valid @RequestBody CreateProjectParam param) {
        long id = IdUtil.getSnowflakeNextId();
        ProjectInfoDto info = new ProjectInfoDto()
                .setName("csAAA")
                .setId(id);
        map.put(id,info);
        return Res.ok(info);
    }

    @Operation(summary = "获取文件上传oss信息")
    @GetMapping("/getOssInfo")
    public ResResult<OssInfo> getOssInfo(){
        OssInfo ossInfo = new OssInfo()
                .setBucketURL(uploadProperties.getServerUrl());
        return Res.ok(ossInfo);
    }
    @Operation(summary = "获取项目列表分页 ")
    @GetMapping("/page")
    public PageResult<List<ProjectInfoDto>> page(Integer page, Integer limit){
        PageResult<List<ProjectInfoDto>> pageResult = new PageResult<>();
        pageResult.setCount(map.size());
        pageResult.setData(ListUtil.toList(map.values()));
        return pageResult;
    }

    @Operation(summary = "获取数据")
    @GetMapping("/get")
    public ResResult<ProjectInfoDto> getData(Long projectId) {
        return Res.ok(map.get(projectId));
    }

    @Operation(summary = "保存项目数据")
    @PostMapping("/save")
    public ResResult<ProjectInfoDto> getData(@RequestBody ProjectInfoDto info) {

        ProjectInfoDto projectInfoDto = map.get(info.getProjectId());
        BeanUtil.copyProperties(info, projectInfoDto, CopyOptions.create().ignoreNullValue());
        return Res.ok();
    }

}

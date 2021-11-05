package cn.bootx.starter.quartz.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.quartz.core.service.QuartzJobService;
import cn.bootx.starter.quartz.dto.QuartzJobDto;
import cn.bootx.starter.quartz.param.QuartzJobParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
* 定时任务
* @author xxm
* @date 2021/11/2
*/
@Api(tags = "定时任务")
@RestController
@RequestMapping("/quartz")
@RequiredArgsConstructor
public class QuartzJobController {
    private final QuartzJobService quartzJobService;

    @ApiOperation("添加")
    @PostMapping("/add")
    public ResResult<Void> add(@RequestBody QuartzJobParam param){
        quartzJobService.add(param);
        return Res.ok();
    }

    @ApiOperation("更新")
    @PostMapping("/update")
    public ResResult<Void> update(@RequestBody QuartzJobParam param){
        quartzJobService.update(param);
        return Res.ok();
    }

    @ApiOperation("分页")
    @GetMapping("/page")
    public ResResult<PageResult<QuartzJobDto>> page(PageParam pageParam, QuartzJobParam param){
        return Res.ok(quartzJobService.page(pageParam,param));
    }

    @ApiOperation("单条")
    @GetMapping("/findById")
    public ResResult<QuartzJobDto> findById(Long id){
        return Res.ok(quartzJobService.findById(id));
    }

    @ApiOperation("启动")
    @PostMapping("/start")
    public ResResult<Void> start(Long id){
        quartzJobService.start(id);
        return Res.ok();
    }

    @ApiOperation("停止")
    @PostMapping("/stop")
    public ResResult<Void> stop(Long id){
        quartzJobService.stop(id);
        return Res.ok();
    }

    @ApiOperation("立即执行")
    @PostMapping("/execute")
    public ResResult<Void> execute(Long id){
        quartzJobService.execute(id);
        return Res.ok();
    }

    @ApiOperation("删除")
    @DeleteMapping("/delete")
    public ResResult<Void> delete(Long id){
        quartzJobService.delete(id);
        return Res.ok();
    }

    @ApiOperation("判断是否是定时任务类")
    @GetMapping("/judgeJobClass")
    public ResResult<String> judgeJobClass(String jobClassName){
        return Res.ok(quartzJobService.judgeJobClass(jobClassName));
    }
}

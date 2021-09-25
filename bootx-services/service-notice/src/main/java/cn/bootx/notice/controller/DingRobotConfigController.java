package cn.bootx.notice.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.notice.core.dingtalk.service.DingRobotConfigService;
import cn.bootx.notice.dto.dingtalk.DingRobotConfigDto;
import cn.bootx.notice.param.dingtalk.DingRobotConfigParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* @author xxm
* @date 2021/9/25
*/
@Api(tags = "钉钉机器人配置")
@RestController
@RequestMapping("/ding/robot/config")
@RequiredArgsConstructor
public class DingRobotConfigController {
    private final DingRobotConfigService dingRobotConfigService;

    @ApiOperation("新增机器人配置")
    @PostMapping("/add")
    public ResResult<DingRobotConfigDto> add(@RequestBody DingRobotConfigParam param){
        return Res.ok(dingRobotConfigService.add(param));
    }

    @ApiOperation("修改机器人配置")
    @PostMapping("/update")
    public ResResult<DingRobotConfigDto> update(@RequestBody DingRobotConfigParam param){
        return Res.ok(dingRobotConfigService.update(param));
    }

    @ApiOperation("分页")
    @GetMapping("/page")
    public ResResult<PageResult<DingRobotConfigDto>> page(PageParam pageParam){
        return Res.ok(dingRobotConfigService.page(pageParam));
    }

    @ApiOperation("查询全部")
    @GetMapping("/findAll")
    public ResResult<List<DingRobotConfigDto>> findAll(){
        return Res.ok(dingRobotConfigService.findAll());
    }


    @ApiOperation("获取详情")
    @GetMapping("/findById")
    public ResResult<DingRobotConfigDto> findById(Long id){
        return Res.ok(dingRobotConfigService.findById(id));
    }

    @ApiOperation("删除")
    @DeleteMapping("/delete")
    public ResResult<Void> delete(Long id){
        dingRobotConfigService.delete(id);
        return Res.ok();
    }

    @ApiOperation("编码是否被使用")
    @GetMapping("/existsByCode")
    public ResResult<Boolean> existsByCode(String code) {
        return Res.ok(dingRobotConfigService.existsByCode(code));
    }

    @ApiOperation("编码是否被使用(不包含自己)")
    @GetMapping("/existsByCodeNotId")
    public ResResult<Boolean> existsByCode(String code,Long id) {
        return Res.ok(dingRobotConfigService.existsByCode(code,id));
    }
}

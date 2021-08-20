package cn.bootx.baseapi.controller;

import cn.bootx.baseapi.core.app.service.AppVersionService;
import cn.bootx.baseapi.dto.app.AppVersionDto;
import cn.bootx.baseapi.param.app.AppVersionParam;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
*
* @author xxm
* @date 2021/8/9
*/
@Api(tags = "app版本管理")
@RestController
@RequestMapping("/app/version")
@RequiredArgsConstructor
public class AppVersionController {
    private final AppVersionService appVersionService;

    @ApiOperation("添加")
    @PostMapping("/add")
    public ResResult<AppVersionDto> add(@RequestBody AppVersionParam param){
        return Res.ok(appVersionService.add(param));
    }

    @ApiOperation("删除")
    @DeleteMapping("/delete")
    public ResResult<Void> delete(Long id){
        appVersionService.delete(id);
        return Res.ok();
    }

    @ApiOperation("检查更新")
    @PostMapping("/check")
    public ResResult<AppVersionDto> check(){
        return Res.ok(appVersionService.check());
    }
    
    @ApiOperation("分页")
    @GetMapping("/page")
    public ResResult<PageResult<AppVersionDto>> page(PageParam pageParam){
        return Res.ok(appVersionService.page(pageParam));
    }

    @ApiOperation("查询详情")
    @PostMapping("/findById")
    public ResResult<AppVersionDto> findById(Long id){
        return Res.ok(appVersionService.findById(id));
    }
}

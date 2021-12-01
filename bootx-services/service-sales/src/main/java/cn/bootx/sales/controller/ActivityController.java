package cn.bootx.sales.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.sales.core.activity.service.ActivityService;
import cn.bootx.sales.dto.activity.ActivityDto;
import cn.bootx.sales.param.activity.ActivityParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* @author xxm
* @date 2021/5/7
*/
@Tag(name ="活动")
@RestController
@RequestMapping("/activity")
@AllArgsConstructor
public class ActivityController {
    private final ActivityService activityService;

    @Operation(summary = "注册活动")
    @PostMapping("/add")
    public ResResult<ActivityDto> add(@RequestBody ActivityParam param){
        return Res.ok(activityService.addByActivity(param));
    }
    
    @Operation(summary = "查询活动")
    @GetMapping("/findAll")
    public ResResult<List<ActivityDto>> findAll(){
        return Res.ok(activityService.findAll());
    }

    @Operation(summary = "查询活动")
    @GetMapping("//get/{id}")
    public ResResult<ActivityDto> get(@PathVariable Long id){
        return Res.ok(activityService.get(id));
    }
}

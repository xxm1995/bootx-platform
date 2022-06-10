package cn.bootx.starter.monitor.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.starter.monitor.entity.SystemMonitorResult;
import cn.bootx.starter.monitor.service.SystemMonitorService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
* @author xxm
* @date 2022/6/10
*/
@Tag(name = "系统信息监控")
@RestController
@RequestMapping("/monitor/system")
@RequiredArgsConstructor
public class SystemMonitorController {
    private final SystemMonitorService systemMonitorService;
    
    @Operation(summary = "获取系统消息")
    @GetMapping("/getSystemInfo")
    public ResResult<SystemMonitorResult> getSystemInfo(){
        return Res.ok(systemMonitorService.getSystemInfo());
    }
}

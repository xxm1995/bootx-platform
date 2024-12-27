package cn.bootx.platform.common.monitor.controller;

import cn.bootx.platform.common.monitor.entity.RedisMonitorResult;
import cn.bootx.platform.common.monitor.entity.SystemMonitorResult;
import cn.bootx.platform.common.monitor.service.RedisMonitorService;
import cn.bootx.platform.common.monitor.service.SystemMonitorService;
import cn.bootx.platform.core.rest.Res;
import cn.bootx.platform.core.rest.result.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author xxm
 * @since 2022/6/10
 */
@Tag(name = "系统信息监控")
@RestController
@RequestMapping("/monitor/system")
@RequiredArgsConstructor
public class SystemMonitorController {

    private final SystemMonitorService systemMonitorService;

    private final RedisMonitorService redisMonitorService;

    @Operation(summary = "获取系统消息")
    @GetMapping("/getSystemInfo")
    public Result<SystemMonitorResult> getSystemInfo() {
        return Res.ok(systemMonitorService.getSystemInfo());
    }

    @Operation(summary = "获取Redis信息")
    @GetMapping("/getRedisInfo")
    public Result<RedisMonitorResult> getRedisInfo() {
        return Res.ok(redisMonitorService.getRedisInfo());
    }

}

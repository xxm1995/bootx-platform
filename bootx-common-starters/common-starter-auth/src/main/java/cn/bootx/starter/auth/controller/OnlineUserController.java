package cn.bootx.starter.auth.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.auth.online.OnlineUserDto;
import cn.bootx.starter.auth.online.OnlineUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "在线用户")
@RestController
@RequestMapping("/user/online")
@RequiredArgsConstructor
public class OnlineUserController {

    private final OnlineUserService onlineUserService;

    @Operation(summary = "分页")
    @GetMapping("/page")
    public ResResult<PageResult<OnlineUserDto>> page(PageParam pageParam) {
        return Res.ok(onlineUserService.page(pageParam));
    }

    @Operation(summary = "获取单条")
    @GetMapping("/findBySessionId")
    public ResResult<OnlineUserDto> findBySessionId(String sessionId) {
        return Res.ok(onlineUserService.findBySessionId(sessionId));
    }

    @Operation(summary = "踢人下线")
    @PostMapping("/logoutByUserId")
    public ResResult<Void> logoutByUserId(Long userId) {
        onlineUserService.logoutByUserId(userId);
        return Res.ok();
    }

}

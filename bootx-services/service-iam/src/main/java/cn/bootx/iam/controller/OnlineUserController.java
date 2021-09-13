package cn.bootx.iam.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.iam.core.online.OnlineUserService;
import cn.bootx.iam.dto.online.OnlineUserDto;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "在线用户")
@RestController
@RequestMapping("/user/online")
@RequiredArgsConstructor
public class OnlineUserController {

    private final OnlineUserService onlineUserService;
    
    @ApiOperation("分页")
    @GetMapping("/page")
    public ResResult<PageResult<OnlineUserDto>> page(PageParam pageParam){
        return Res.ok(onlineUserService.page(pageParam));
    }

    @ApiOperation("获取单条")
    @GetMapping("/findBySessionId")
    public ResResult<OnlineUserDto> findBySessionId(String sessionId){
        return Res.ok(onlineUserService.findBySessionId(sessionId));
    }

    @ApiOperation("踢人下线")
    @PostMapping("/logoutByUserId")
    public ResResult<Void> logoutByUserId(Long userId){
        onlineUserService.logoutByUserId(userId);
        return Res.ok();
    }
}

package cn.bootx.starter.audit.log.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.audit.log.core.service.LoginLogService;
import cn.bootx.starter.audit.log.dto.LoginLogDto;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**   
*
* @author xxm  
* @date 2021/9/7 
*/
@Tag(name = "登录日志")
@RestController
@RequestMapping("/log/login")
@RequiredArgsConstructor
public class LoginLogController {
    private final LoginLogService loginLogService;

    @Operation(summary = "分页")
    @GetMapping("/page")
    public ResResult<PageResult<LoginLogDto>> page(PageParam pageParam, LoginLogDto loginLogDto){
        return Res.ok(loginLogService.page(pageParam,loginLogDto));
    }

    @Operation(summary = "获取")
    @GetMapping("/findById")
    public ResResult<LoginLogDto> findById(Long id){
        return Res.ok(loginLogService.findById(id));
    }
}

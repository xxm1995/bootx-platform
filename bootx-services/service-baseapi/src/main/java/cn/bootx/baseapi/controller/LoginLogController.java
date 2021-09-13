package cn.bootx.baseapi.controller;

import cn.bootx.baseapi.core.log.service.LoginLogService;
import cn.bootx.baseapi.dto.log.LoginLogDto;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**   
*
* @author xxm  
* @date 2021/9/7 
*/
@Api(tags = "登录日志")
@RestController
@RequestMapping("/log/login")
@RequiredArgsConstructor
public class LoginLogController {
    private final LoginLogService loginLogService;

    @ApiOperation("分页")
    @GetMapping("/page")
    public ResResult<PageResult<LoginLogDto>> page(PageParam pageParam, LoginLogDto loginLogDto){
        return Res.ok(loginLogService.page(pageParam,loginLogDto));
    }
}

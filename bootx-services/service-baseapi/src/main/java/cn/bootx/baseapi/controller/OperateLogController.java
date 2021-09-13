package cn.bootx.baseapi.controller;

import cn.bootx.baseapi.core.log.service.OperateLogService;
import cn.bootx.baseapi.dto.log.OperateLogDto;
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
* 操作日志
* @author xxm
* @date 2021/9/8
*/
@Api(tags = "操作日志")
@RestController
@RequestMapping("/log/operate")
@RequiredArgsConstructor
public class OperateLogController {
    private final OperateLogService operateLogService;

    @ApiOperation("分页")
    @GetMapping("/page")
    public ResResult<PageResult<OperateLogDto>> page(PageParam pageParam, OperateLogDto operateLogDto){
        return Res.ok(operateLogService.page(pageParam,operateLogDto));
    }
}

package cn.bootx.demo.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.demo.core.service.DemoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
* 演示
* @author xxm
* @date 2021/8/6
*/
@Api(tags = "演示类")
@RestController
@RequestMapping("/demo")
@RequiredArgsConstructor
public class DemoController {
    private final DemoService demoService;

    @ApiOperation("hello演示")
    @GetMapping("/hello")
    public ResResult<String> hello(){
        return Res.ok(demoService.hello());
    }
}

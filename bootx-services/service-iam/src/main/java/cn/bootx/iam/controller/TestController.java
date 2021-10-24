package cn.bootx.iam.controller;

import cn.bootx.common.core.annotation.OperateLog;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.idempotency.annotation.Idempotent;
import cn.bootx.common.sequence.func.Sequence;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@Api(tags = "测试控制器")
@RestController
@RequestMapping("/test")
@RequiredArgsConstructor
public class TestController {
    private final Sequence sequence;

    @OperateLog(title = "测试日志")
    @Idempotent
    @ApiOperation("测试")
    @GetMapping("/hello")
    public ResResult<String> hello(){
        return Res.ok("hello");
    }

    @OperateLog(title = "测试回声日志",isParam = true,isrReturn = true)
    @ApiOperation("测试回声")
    @GetMapping("/say")
    public ResResult<String> say(String msg){
        return Res.ok(msg);
    }


    @ApiOperation("发号器")
    @GetMapping("/sequence")
    public ResResult<String> sequence(){
        long cs = sequence.next("cs");
        return Res.ok(String.valueOf(cs));
    }
}

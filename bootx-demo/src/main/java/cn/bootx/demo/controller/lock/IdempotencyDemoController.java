package cn.bootx.demo.controller.lock;

import cn.bootx.common.core.annotation.Idempotent;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.lock.annotation.Lock;
import cn.hutool.core.thread.ThreadUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.TimeUnit;

/**   
* 幂等控制演示
* @author xxm  
* @date 2022/3/31 
*/
@Slf4j
@Tag(name ="幂等控制演示")
@RestController
@RequestMapping("/demo/lock")
@RequiredArgsConstructor
public class IdempotencyDemoController {

    @Idempotent(name = "idempotent",timeout = 1000)
    @Operation(summary = "幂等演示")
    @PostMapping("/idempotency")
    public ResResult<String> idempotency(){
        return Res.ok("幂等演示");
    }

    @Operation(summary = "分布式锁(暂停5秒)")
    @PostMapping("/lock5")
    @Lock(name = "test:lock")
    public ResResult<Void> lock5(){
        ThreadUtil.sleep(5, TimeUnit.SECONDS);
        return Res.ok();
    }

    @Operation(summary = "分布式锁(暂停20秒)")
    @PostMapping("/lock20")
    @Lock(name = "test:lock")
    public ResResult<Void> lock20(){
        ThreadUtil.sleep(20, TimeUnit.SECONDS);
        return Res.ok();
    }

    @Operation(summary = "分布式锁(不暂停)")
    @PostMapping("/lock0")
    @Lock(name = "test:lock")
    public ResResult<Void> lock0(){
        return Res.ok();
    }

}

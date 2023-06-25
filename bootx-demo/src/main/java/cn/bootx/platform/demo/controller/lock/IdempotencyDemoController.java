package cn.bootx.platform.demo.controller.lock;

import cn.bootx.platform.common.core.annotation.Idempotent;
import cn.bootx.platform.common.core.rest.Res;
import cn.bootx.platform.common.core.rest.ResResult;
import cn.hutool.core.thread.ThreadUtil;
import com.baomidou.lock.annotation.Lock4j;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.TimeUnit;

/**
 * 幂等控制演示
 *
 * @author xxm
 * @since 2022/3/31
 */
@Slf4j
@Tag(name = "幂等控制演示")
@RestController
@RequestMapping("/demo/lock")
@RequiredArgsConstructor
public class IdempotencyDemoController {

    @Idempotent(name = "idempotent", timeout = 3000)
    @Operation(summary = "幂等演示")
    @PostMapping("/idempotency")
    public ResResult<String> idempotency() {
        return Res.ok("幂等演示...");
    }

    @Operation(summary = "分布式锁(暂停5秒)")
    @GetMapping("/lock5")
    @Lock4j(name = "test:lock", keys = "#a", acquireTimeout = 60000)
    public ResResult<Void> lock5(Integer a) {
        log.info("开始");
        System.out.println(1);
        ThreadUtil.sleep(5, TimeUnit.SECONDS);
        log.info("结束");
        return Res.ok();
    }

    @Operation(summary = "分布式锁(暂停20秒)")
    @GetMapping("/lock20")
    @Lock4j(name = "test:lock", keys = "#a", acquireTimeout = 60000)
    public ResResult<Void> lock20(Integer a) {
        log.info("开始");
        System.out.println(2);
        ThreadUtil.sleep(20, TimeUnit.SECONDS);
        log.info("结束");
        return Res.ok();
    }

    @Operation(summary = "分布式锁(不暂停)")
    @PostMapping("/lock0")
    @Lock4j(name = "test:lock")
    public ResResult<Void> lock0() {
        return Res.ok();
    }

}

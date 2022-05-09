package cn.bootx.demo.controller;

import cn.bootx.common.core.annotation.Idempotent;
import cn.bootx.common.core.annotation.OperateLog;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.dto.KeyValue;
import cn.bootx.common.lock.annotation.Lock;
import cn.bootx.common.redis.RedisClient;
import cn.bootx.common.redis.code.RedisCode;
import cn.bootx.common.sequence.func.Sequence;
import cn.bootx.common.sequence.impl.DefaultRangeSequence;
import cn.bootx.common.sequence.range.SeqRangeConfig;
import cn.bootx.common.sequence.range.SeqRangeManager;
import cn.hutool.core.thread.ThreadUtil;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.TimeUnit;

@Slf4j
@Tag(name ="测试控制器")
@RestController
@RequestMapping("/test")
@RequiredArgsConstructor
public class TestController {
    private final Sequence sequence;
    private final SeqRangeManager seqRangeManager;
    private final RedisClient redisClient;
    private final StringRedisTemplate stringRedisTemplate;
    private final RedisTemplate<String,Object> redisTemplate;

    @OperateLog(title = "测试日志")
    @OperateLog(title = "测试重复日志")
    @Idempotent
    @Operation(summary = "测试")
    @GetMapping("/hello")
    public ResResult<String> hello(){
        return Res.ok("hello");
    }

    @OperateLog(title = "测试回声日志", saveParam = true, saverReturn = true)
    @Operation(summary = "测试回声")
    @GetMapping("/say")
    public ResResult<String> say(String msg){
        return Res.ok(msg);
    }


    @Operation(summary = "发号器")
    @GetMapping("/sequence")
    public ResResult<String> sequence(){
        long cs = sequence.next("cs");
        return Res.ok(String.valueOf(cs));
    }

    @Operation(summary = "发号器自定义")
    @GetMapping("/sequenceZdy")
    public ResResult<Long> sequenceZdy(){
        SeqRangeConfig seqRangeConfig = new SeqRangeConfig()
                .setStep(5)
                .setRangeStart(0)
                .setRangeStep(5);
        DefaultRangeSequence defaultRangeSequence = new DefaultRangeSequence(seqRangeManager, seqRangeConfig);
        return Res.ok(defaultRangeSequence.next("aa"));
    }

    @Operation(summary = "lock1")
    @GetMapping("/lock1")
    @Lock(keys = "#x",name="lock",waitTime = Long.MAX_VALUE)
    public ResResult<Void> lock1(Integer x){
        log.info("start");
        ThreadUtil.sleep(15, TimeUnit.SECONDS);
        log.info("end");
        return Res.ok();
    }
    @Operation(summary="lock2")
    @GetMapping("/lock2")
    @Lock(keys = "#x",name="lock",waitTime = Long.MAX_VALUE)
    public ResResult<Void> lock2(Integer x){
        log.info("345");
        return Res.ok();
    }

    @Operation(summary = "redis消息队列发布")
    @GetMapping("/redisPub")
    public ResResult<Void> redisPub(){
//        redisClient.convertAndSend("t1","aaass");
//        redisClient.convertAndSend("t2",new KeyValue("aa","bbb"));
        redisTemplate.convertAndSend(RedisCode.TOPIC_PREFIX+"t1","aaass");
        redisTemplate.convertAndSend(RedisCode.TOPIC_PREFIX+"t2",new KeyValue("aa","bbb"));
//        stringRedisTemplate.convertAndSend(RedisCode.TOPIC_PREFIX+"t1","aaass");
//        stringRedisTemplate.convertAndSend(RedisCode.TOPIC_PREFIX+"t2",new KeyValue("aa","bbb"));
        return Res.ok();
    }
}

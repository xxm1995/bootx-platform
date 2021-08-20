package cn.bootx.common.idempotency.aop;

import cn.bootx.common.core.exception.RepetitiveOperationException;
import cn.bootx.common.headerholder.HeaderHolder;
import cn.bootx.common.idempotency.annotation.Idempotent;
import cn.bootx.common.redis.RedisClient;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Slf4j
@Component
@RequiredArgsConstructor
public class IdempotentAop {
    private final RedisClient redisClient;

    @SneakyThrows
    @Around("@annotation(idempotent)")
    public Object doAround(ProceedingJoinPoint pjp, Idempotent idempotent){
        boolean enable = idempotent.enable();
        if (enable){
            String opToken = HeaderHolder.getOpToken();
            if (StrUtil.isNotBlank(opToken)){
                Boolean flag = redisClient.setIfAbsent("opToken:" + opToken, "", idempotent.timeout());
                if (Boolean.FALSE.equals(flag)){
                    throw new RepetitiveOperationException();
                }
            }
        }
        return pjp.proceed();
    }
}

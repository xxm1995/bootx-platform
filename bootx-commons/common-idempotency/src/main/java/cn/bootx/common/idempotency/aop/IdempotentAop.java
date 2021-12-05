package cn.bootx.common.idempotency.aop;

import cn.bootx.common.core.annotation.Idempotent;
import cn.bootx.common.core.code.WebHeaderCode;
import cn.bootx.common.core.exception.RepetitiveOperationException;
import cn.bootx.common.headerholder.HeaderHolder;
import cn.bootx.common.redis.RedisClient;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

/**
* 幂等处理器切面
* @author xxm
* @date 2021/08/20
*/
@Aspect
@Slf4j
@Component
@RequiredArgsConstructor
public class IdempotentAop {
    private final RedisClient redisClient;

    /**
     * 幂等切面
     */
    @SneakyThrows
    @Around("@annotation(idempotent)")
    public Object doAround(ProceedingJoinPoint pjp, Idempotent idempotent){
        // todo 不拦截option相关方法
        boolean enable = idempotent.enable();
        if (enable){
            String opToken = HeaderHolder.getIdempotentToken();
            if (StrUtil.isNotBlank(opToken)){
                Boolean flag = redisClient.setIfAbsent(WebHeaderCode.IDEMPOTENT_TOKEN + opToken, "", idempotent.timeout());
                if (Boolean.FALSE.equals(flag)){
                    throw new RepetitiveOperationException();
                }
            }
        }
        return pjp.proceed();
    }
}

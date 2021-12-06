package cn.bootx.common.idempotency.aop;

import cn.bootx.common.core.annotation.Idempotent;
import cn.bootx.common.core.code.WebHeaderCode;
import cn.bootx.common.core.exception.RepetitiveOperationException;
import cn.bootx.common.headerholder.HeaderHolder;
import cn.bootx.common.redis.RedisClient;
import cn.bootx.common.spring.util.WebServletUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.Method;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.Locale;

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
    private final List<String> METHODS = Arrays.asList(Method.GET.name(),Method.POST.name(),Method.PUT.name(),Method.DELETE.name());
    /**
     * 幂等切面
     */
    @SneakyThrows
    @Around("@annotation(idempotent)")
    public Object doAround(ProceedingJoinPoint pjp, Idempotent idempotent){
        if (idempotent.enable()){
            String method = WebServletUtil.getMethod();
            // 只处理四种经典的情况
            if (METHODS.contains(method.toUpperCase(Locale.ROOT))){
                String idempotentToken = HeaderHolder.getIdempotentToken();
                if (StrUtil.isNotBlank(idempotentToken)){
                    Boolean flag = redisClient.setIfAbsent(WebHeaderCode.IDEMPOTENT_TOKEN + idempotentToken, "", idempotent.timeout());
                    if (Boolean.FALSE.equals(flag)){
                        throw new RepetitiveOperationException();
                    }
                }
            }
        }
        return pjp.proceed();
    }
}

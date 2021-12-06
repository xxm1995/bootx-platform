package cn.bootx.common.spring.aop;

import cn.bootx.common.core.annotation.CountTime;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;


/**
 * 方法耗时工具类
 * @author xxm
 * @date 2020/12/22
 */
@Aspect
@Slf4j
@Component
public class CountTimeAop {

    @Around("@annotation(countTime)")
    public Object doAround(ProceedingJoinPoint pjp, CountTime countTime){
        long startTime = System.currentTimeMillis();
        Object obj = null;
        try {
            obj = pjp.proceed();
        } catch (Throwable e) {
            e.printStackTrace();
        }
        long endTime = System.currentTimeMillis();
        MethodSignature signature = (MethodSignature) pjp.getSignature();
        String methodName = signature.getDeclaringTypeName() + "." + signature.getName();
        log.info("方法 [{}] 花费时间：{}ms",methodName,(endTime-startTime));
        return obj;
    }

}

package cn.bootx.starter.data.perm.handler;

import cn.bootx.common.core.annotation.Permission;
import cn.bootx.common.spring.util.AopUtil;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.bootx.starter.data.perm.local.DataPermContextHolder;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.util.Objects;

/**
* 忽略权限控制切面处理类
* @author xxm
* @date 2021/12/22
*/
@Slf4j
@Aspect
@Component
@RequiredArgsConstructor
public class DataPermAspectHandler {

    @Around("@annotation(permission)||@within(permission)")
    public Object doAround(ProceedingJoinPoint pjp, Permission permission){
        Object obj = null;
        // 如果方法和类同时存在, 以方法上的注解为准
        Permission methodAnnotation = AopUtil.getMethodAnnotation(pjp, Permission.class);
        if (Objects.nonNull(methodAnnotation)){
            DataPermContextHolder.putPermission(methodAnnotation);
        } else {
            DataPermContextHolder.putPermission(permission);
        }
        DataPermContextHolder.putUserDetail(SecurityUtil.getCurrentUser().orElse(null));
        try {
            obj = pjp.proceed();
        } catch (Throwable e) {
            e.printStackTrace();
        } finally {
            DataPermContextHolder.clear();
        }
        return obj;
    }

}

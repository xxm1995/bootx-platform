package cn.bootx.starter.data.perm.handler;

import cn.bootx.common.core.annotation.Permission;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.bootx.starter.data.perm.local.DataPermContextHolder;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

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
        DataPermContextHolder.putPermission(permission);
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

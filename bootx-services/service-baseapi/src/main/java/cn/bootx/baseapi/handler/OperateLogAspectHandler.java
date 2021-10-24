package cn.bootx.baseapi.handler;

import cn.bootx.baseapi.core.log.service.OperateLogService;
import cn.bootx.common.core.annotation.OperateLog;
import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.jackson.utils.JacksonUtils;
import cn.bootx.common.spring.util.WebServletUtils;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.hutool.extra.servlet.ServletUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.util.Locale;
import java.util.Objects;
import java.util.Optional;

/**
* 操作日志切面处理
* @author xxm
* @date 2021/8/13
*/
@Slf4j
@Aspect
@Component
@RequiredArgsConstructor
public class OperateLogAspectHandler {
    private final OperateLogService operateLogService;

    /**
     * 配置织入点
     */
    @Pointcut("@annotation(cn.bootx.common.core.annotation.OperateLog)")
    public void logPointCut(){
    }

    /**
     * 处理完请求后执行
     */
    @AfterReturning(pointcut = "logPointCut()", returning = "o")
    public void doAfterReturning(JoinPoint joinPoint, Object o){
        handleLog(joinPoint, null, o);
    }

    /**
     * 拦截异常操作
     */
    @AfterThrowing(value = "logPointCut()", throwing = "e")
    public void doAfterThrowing(JoinPoint joinPoint, Exception e){
        handleLog(joinPoint, e, null);
    }


    /**
     * 操作log处理
     */
    protected void handleLog(JoinPoint joinPoint, Exception e, Object o){
        OperateLog log = getAnnotationLog(joinPoint);
        if (Objects.isNull(log)){
            return;
        }

        // 基础信息
        HttpServletRequest request = WebServletUtils.getRequest();
        String ip = ServletUtil.getClientIP(request);
        Optional<UserDetail> currentUser = SecurityUtil.getCurrentUser();
        // 设置方法名称
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();

        cn.bootx.baseapi.core.log.entity.OperateLog operateLog = new cn.bootx.baseapi.core.log.entity.OperateLog()
                .setTitle(log.title())
                .setOperateId(currentUser.map(UserDetail::getId).orElse(0L))
                .setUsername(currentUser.map(UserDetail::getUsername).orElse(null))
                .setBusinessType(log.businessType().name().toLowerCase(Locale.ROOT))
                .setOperateUrl(request.getRequestURI())
                .setMethod(className + "#" + methodName)
                .setRequestMethod(request.getMethod())
                .setSuccess(true)
                .setOperateIp(ip)
                .setOperateTime(LocalDateTime.now());

        // 异常流
        if (Objects.nonNull(e)){
            operateLog.setSuccess(false)
                    .setErrorMsg(e.getMessage());
        }

        // 参数
        if (log.isParam()){
            Object[] args = joinPoint.getArgs();
            operateLog.setOperateParam(JacksonUtils.toJson(args));
        }

        // 返回值
        if (log.isrReturn()){
            operateLog.setOperateReturn(JacksonUtils.toJson(o));
        }

        operateLogService.add(operateLog);
    }

    /**
     * 获取注解
     */
    private OperateLog getAnnotationLog(JoinPoint joinPoint) {
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        Method method = methodSignature.getMethod();

        if (method != null) {
            return method.getAnnotation(OperateLog.class);
        }
        return null;
    }

}

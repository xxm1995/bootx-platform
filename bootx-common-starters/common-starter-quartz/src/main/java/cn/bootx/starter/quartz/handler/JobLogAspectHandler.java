package cn.bootx.starter.quartz.handler;

import cn.bootx.starter.quartz.core.entity.QuartzJobLog;
import cn.bootx.starter.quartz.core.service.QuartzJobLogService;
import cn.hutool.core.date.LocalDateTimeUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * 定时任务日志切面
 * @author xxm
 * @date 2022/5/1
 */
@Slf4j
@Aspect
@Component
@RequiredArgsConstructor
public class JobLogAspectHandler {
    private final QuartzJobLogService quartzJobLogService;
    /**
     * 配置织入点 Job 的子类 执行类
     */
    @Pointcut("within(org.quartz.Job+)&&args(org.quartz.JobExecutionContext)")
    public void logPointCut(){
    }

    /**
     * 处理完请求后执行
     */
    @Around("logPointCut()")
    public Object doAfterReturning(ProceedingJoinPoint pjp) throws Throwable {
        String className = pjp.getTarget().getClass().getName();
        LocalDateTime start = LocalDateTime.now();
        try {
            Object result = pjp.proceed();
            LocalDateTime end = LocalDateTime.now();
            this.addLog(className,start,end);
            // 保存正常日志
            return result;
        } catch (Throwable e) {
            // 保存异常日志
            this.addErrLog(className, start, e.getMessage());
            throw e;
        }
    }

    /**
     * 记录日志
     */
    private void addLog(String className, LocalDateTime start, LocalDateTime end){
        long duration = LocalDateTimeUtil.between(start, end).toMillis();
        QuartzJobLog quartzJobLog = new QuartzJobLog()
                .setHandlerName(className)
                .setSuccess(true)
                .setStartTime(start)
                .setEndTime(end)
                .setDuration(duration);
        quartzJobLogService.add(quartzJobLog);
    }
    /**
     * 记录日志
     */
    private void addErrLog(String className, LocalDateTime start, String message){
        QuartzJobLog quartzJobLog = new QuartzJobLog()
                .setHandlerName(className)
                .setSuccess(false)
                .setErrorMessage(message)
                .setStartTime(start);
        quartzJobLogService.add(quartzJobLog);
    }

}

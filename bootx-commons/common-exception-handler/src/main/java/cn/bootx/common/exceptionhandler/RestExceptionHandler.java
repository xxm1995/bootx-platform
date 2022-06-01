package cn.bootx.common.exceptionhandler;

import cn.bootx.common.core.code.CommonCode;
import cn.bootx.common.core.code.CommonErrorCode;
import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.FatalException;
import cn.bootx.common.core.exception.SystemException;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.MDC;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.http.converter.HttpMessageConversionException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**   
* Web 项目异常处理
* @author xxm  
* @date 2020/5/8 15:30 
*/
@Slf4j
@RestControllerAdvice
@EnableConfigurationProperties(ExceptionHandlerProperties.class)
@RequiredArgsConstructor
public class RestExceptionHandler {
    private final ExceptionHandlerProperties properties;

    /**
     * 业务异常
     */
    @ExceptionHandler(BizException.class)
    public ResResult<Void> handleBusinessException(BizException ex) {
        log.info(ex.getMessage(), ex);
        return Res.response(ex.getCode(),ex.getMessage(),MDC.get(CommonCode.TRACE_ID));
    }

    /**
     * 处理 MissingServletRequestParameterException ( 缺少 必填的request param )
     */
    @ExceptionHandler(MissingServletRequestParameterException.class)
    public ResResult<Void> handleMissingServletRequestParameterException(MissingServletRequestParameterException ex) {
        log.info(ex.getMessage(), ex);
        return Res.response(CommonErrorCode.VALIDATE_PARAMETERS_ERROR, "参数处理失败",MDC.get(CommonCode.TRACE_ID));
    }

    /**
     * 处理 SystemException
     */
    @ExceptionHandler(SystemException.class)
    public ResResult<Void> handleSystemException(SystemException ex) {
        log.info(ex.getMessage(), ex);
        return Res.response(ex.getCode(), ex.getMessage(),MDC.get(CommonCode.TRACE_ID));
    }

    /**
     * 处理 HttpMessageConversionException
     */
    @ExceptionHandler(HttpMessageConversionException.class)
    public ResResult<Void> handleHttpMessageConversionException(HttpMessageConversionException ex) {
        log.info(ex.getMessage(), ex);
        return Res.response(CommonErrorCode.PARSE_PARAMETERS_ERROR, ex.getMessage(),MDC.get(CommonCode.TRACE_ID));
    }

    /**
     * 处理 FatalException
     */
    @ExceptionHandler(FatalException.class)
    public ResResult<Void> handleFatalException(FatalException ex) {
        log.error("致命异常 " + ex.getMessage(), ex);
        return Res.response(ex.getCode(), ex.getMessage(),MDC.get(CommonCode.TRACE_ID));
    }

    /**
     * 处理 FatalException
     */
    @ExceptionHandler(NullPointerException.class)
    public ResResult<Void> handleNullPointerException(NullPointerException ex) {
        log.error("空指针 ", ex);
        return Res.response(CommonErrorCode.SYSTEM_ERROR, "数据错误",MDC.get(CommonCode.TRACE_ID));
    }

    /**
     * 处理 RuntimeException
     */
    @ExceptionHandler(RuntimeException.class)
    public ResResult<Void> handleRuntimeException(RuntimeException ex) {
        log.error(ex.getMessage(), ex);
        if (properties.isShowFullMessage()){
            return Res.response(CommonErrorCode.SYSTEM_ERROR, ex.getMessage(),MDC.get(CommonCode.TRACE_ID));
        } else {
            return Res.response(CommonErrorCode.SYSTEM_ERROR, "系统错误",MDC.get(CommonCode.TRACE_ID));
        }
    }


    /**
     * 处理 OutOfMemoryError
     */
    @ExceptionHandler(OutOfMemoryError.class)
    public ResResult<Void> handleOomException(OutOfMemoryError ex) {
        log.error("内存不足错误 " + ex.getMessage(), ex);
        return Res.response(CommonErrorCode.SYSTEM_ERROR, "系统错误",MDC.get(CommonCode.TRACE_ID));
    }

    /**
     * 处理 Throwable 异常
     */
    @ExceptionHandler(Throwable.class)
    public ResResult<Void> handleThrowable(Throwable ex) {
        log.error("系统错误 " + ex.getMessage(), ex);
        return Res.response(CommonErrorCode.SYSTEM_ERROR, "系统错误",MDC.get(CommonCode.TRACE_ID));
    }
    
}

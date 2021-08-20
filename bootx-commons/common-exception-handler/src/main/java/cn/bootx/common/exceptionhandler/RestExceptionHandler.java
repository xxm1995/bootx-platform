package cn.bootx.common.exceptionhandler;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.FatalException;
import cn.bootx.common.core.exception.SystemException;
import cn.bootx.common.core.rest.CommonErrorCodes;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import lombok.extern.slf4j.Slf4j;
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
public class RestExceptionHandler {

    /**
     * 业务异常
     */
    @ExceptionHandler(BizException.class)
    public ResResult<Void> handleBusinessException(BizException ex) {
        log.info(ex.getMessage(), ex);
        return Res.response(ex.getCode(),ex.getMessage());
    }

    /**
     * 处理 MissingServletRequestParameterException ( 缺少 必填的request param )
     */
    @ExceptionHandler(MissingServletRequestParameterException.class)
    public ResResult<Void> handleMissingServletRequestParameterException(MissingServletRequestParameterException ex) {
        log.info(ex.getMessage(), ex);
        return Res.response(CommonErrorCodes.VALIDATE_PARAMETERS_ERROR, "参数处理失败");
    }

    /**
     * 处理 SystemException
     */
    @ExceptionHandler(SystemException.class)
    public ResResult<Void> handleSystemException(SystemException ex) {
        log.info(ex.getMessage(), ex);
        return Res.response(ex.getCode(), ex.getMessage());
    }

    /**
     * 处理 HttpMessageConversionException
     */
    @ExceptionHandler(HttpMessageConversionException.class)
    public ResResult<Void> handleHttpMessageConversionException(HttpMessageConversionException ex) {
        log.info(ex.getMessage(), ex);
        return Res.response(CommonErrorCodes.PARSE_PARAMETERS_ERROR, ex.getMessage());
    }

    /**
     * 处理 FatalException
     */
    @ExceptionHandler(FatalException.class)
    public ResResult<Void> handleFatalException(FatalException ex) {
        log.error("致命异常 " + ex.getMessage(), ex);
        return Res.response(ex.getCode(), ex.getMessage());
    }

    /**
     * 处理 RuntimeException
     */
    @ExceptionHandler(RuntimeException.class)
    public ResResult<Void> handleRuntimeException(RuntimeException ex) {
        log.error(ex.getMessage(), ex);
        return Res.response(CommonErrorCodes.UNKNOWN_ERROR, ex.getMessage());
    }


    /**
     * 处理 OutOfMemoryError
     */
    @ExceptionHandler(OutOfMemoryError.class)
    public ResResult<Void> handleOomException(OutOfMemoryError ex) {
        log.error("内存不足错误 " + ex.getMessage(), ex);
        return Res.response(CommonErrorCodes.SYSTEM_ERROR, "系统错误");
    }
    
}

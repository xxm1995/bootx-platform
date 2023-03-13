package cn.bootx.common.core.exception;

import java.io.Serializable;

import static cn.bootx.common.core.code.CommonErrorCode.UN_SUPPORTED_OPERATE;

/**
 * 不支持的操作异常
 *
 * @author xxm
 * @date 2022/7/27
 */
public class UnSupportOperateException extends ErrorCodeRuntimeException implements Serializable {

    public UnSupportOperateException(String message) {
        super(UN_SUPPORTED_OPERATE, message);
    }

    public UnSupportOperateException() {
        super(UN_SUPPORTED_OPERATE, "不支持的操作异常");
    }

}

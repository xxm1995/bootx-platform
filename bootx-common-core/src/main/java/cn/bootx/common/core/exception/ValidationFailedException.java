package cn.bootx.common.core.exception;

import java.io.Serializable;

import static cn.bootx.common.core.rest.CommonErrorCodes.VALIDATE_PARAMETERS_ERROR;

/**
 * 验证失败异常
 */
public class ValidationFailedException extends SystemException implements Serializable {

    private static final long serialVersionUID = -3973809880035275189L;

    public ValidationFailedException(String detail) {
        super(VALIDATE_PARAMETERS_ERROR, "验证参数错误" + System.lineSeparator() + detail);
    }
    public ValidationFailedException(){
        super();
    }

}

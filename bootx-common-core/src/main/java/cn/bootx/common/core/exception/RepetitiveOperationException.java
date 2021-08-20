package cn.bootx.common.core.exception;

import java.io.Serializable;

import static cn.bootx.common.core.rest.CommonErrorCodes.REPETITIVE_OPERATION_ERROR;

/**   
* 重复操作异常
* @author xxm  
* @date 2021/1/2 
*/
public class RepetitiveOperationException extends SystemException implements Serializable {
    private static final long serialVersionUID = 2120383728758502943L;

    public RepetitiveOperationException() {
        super(REPETITIVE_OPERATION_ERROR, "重复操作异常");
    }
}

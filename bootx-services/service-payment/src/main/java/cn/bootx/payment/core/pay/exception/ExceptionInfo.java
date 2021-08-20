package cn.bootx.payment.core.pay.exception;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* @author xxm
* @date 2021/5/24
*/
@Data
@Accessors(chain = true)
@ApiModel("异常信息")
public class ExceptionInfo {
    /** 错误码 */
    private int errorCode;
    /** 错误信息 */
    private String errorMsg;

    public ExceptionInfo(int errorCode, String errorMsg) {
        this.errorCode = errorCode;
        this.errorMsg = errorMsg;
    }

}
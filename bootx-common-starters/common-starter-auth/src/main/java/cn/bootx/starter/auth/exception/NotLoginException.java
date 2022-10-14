package cn.bootx.starter.auth.exception;

import cn.bootx.common.core.exception.BizException;

import static cn.bootx.common.core.code.CommonErrorCode.AUTHENTICATION_FAIL;

/**
* 未登录异常
* @author xxm
* @date 2021/12/22
*/
public class NotLoginException extends BizException {

    public NotLoginException(String msg){
        super(AUTHENTICATION_FAIL,msg);
    }

    public NotLoginException() {
        super(AUTHENTICATION_FAIL,"未登录");
    }
}

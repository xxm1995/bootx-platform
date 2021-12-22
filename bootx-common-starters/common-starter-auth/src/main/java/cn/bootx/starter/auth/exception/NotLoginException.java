package cn.bootx.starter.auth.exception;

import cn.bootx.common.core.exception.BizException;

/**
* 未登录异常
* @author xxm
* @date 2021/12/22
*/
public class NotLoginException extends BizException {
    public NotLoginException() {
        super("未登录");
    }
}

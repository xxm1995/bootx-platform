package cn.bootx.starter.auth.exception;

import cn.bootx.common.core.exception.BizException;
import lombok.Getter;

/**
*
* @author xxm
* @date 2021/8/13
*/
public class LoginFailureException extends BizException {
    @Getter
    private final String username;
    public LoginFailureException(String username,String message) {
        super(message);
        this.username = username;
    }
}

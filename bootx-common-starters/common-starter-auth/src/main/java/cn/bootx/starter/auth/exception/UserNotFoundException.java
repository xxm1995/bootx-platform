package cn.bootx.starter.auth.exception;

/**
* 异常
* @author xxm  
* @date 2021/7/30 
*/
public class UserNotFoundException extends LoginFailureException {
    public UserNotFoundException(String username) {
        super(username,"用户未找到异常");
    }
}

package cn.bootx.starter.auth.exception;

import cn.bootx.common.core.exception.BizException;

/**   
* 路径检查异常
* @author xxm  
* @date 2021/12/21 
*/
public class RouterCheckException extends BizException {

    public RouterCheckException() {
        super("没有对应请求路径的权限");
    }
}

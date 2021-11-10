package cn.bootx.starter.auth.exception;


import cn.bootx.common.core.exception.BizException;

/**   
* 终端不存在
* @author xxm  
* @date 2021/8/25 
*/
public class ClientNotFoundException extends BizException {
    public ClientNotFoundException() {
        super("未找到对应的终端");
    }
}

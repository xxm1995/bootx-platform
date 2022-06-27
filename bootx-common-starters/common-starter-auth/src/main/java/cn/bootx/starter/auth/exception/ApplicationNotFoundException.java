package cn.bootx.starter.auth.exception;

import cn.bootx.common.core.exception.BizException;

/**   
* 应用不存在
* @author xxm  
* @date 2022/6/27 
*/
public class ApplicationNotFoundException extends BizException {
    public ApplicationNotFoundException() {
        super("未找到对应的应用");
    }
}

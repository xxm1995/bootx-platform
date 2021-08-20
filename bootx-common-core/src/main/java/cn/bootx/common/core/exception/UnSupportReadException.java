package cn.bootx.common.core.exception;


import java.io.Serializable;

import static cn.bootx.common.core.rest.CommonErrorCodes.UN_SUPPORTED_READ;

/**   
* 不支持的读取操作
* @author xxm  
* @date 2020/4/10 14:05 
*/
public class UnSupportReadException extends BizException implements Serializable {
    private static final long serialVersionUID = -743586662489535860L;

    public UnSupportReadException() {
        super(UN_SUPPORTED_READ, "不支持的读取下载响应");
    }
}

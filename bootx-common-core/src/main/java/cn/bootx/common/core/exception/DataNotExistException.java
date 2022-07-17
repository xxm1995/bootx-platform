package cn.bootx.common.core.exception;

import static cn.bootx.common.core.code.CommonErrorCode.DATA_NOT_EXIST;

/**
* 数据不存在异常
* @author xxm  
* @date 2022/1/10 
*/
public class DataNotExistException extends BizException{

    public DataNotExistException(String msg) {
        super(DATA_NOT_EXIST, msg);
    }
    public DataNotExistException() {
        super(DATA_NOT_EXIST, "数据不存在");
    }

}

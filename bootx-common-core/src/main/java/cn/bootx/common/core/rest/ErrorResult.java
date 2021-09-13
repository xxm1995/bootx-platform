package cn.bootx.common.core.rest;

import lombok.Getter;
import lombok.Setter;

/**
* 错误响应类,携带链路追踪标示 trackId
* @author xxm  
* @date 2021/9/9 
*/
public class ErrorResult<T> extends  ResResult<T>{

    /** 链路追踪标示 */
    @Getter
    @Setter
    private String traceId;

    public ErrorResult(int code, String msg, String traceId) {
        super(code,msg);
        this.traceId = traceId;
    }
}

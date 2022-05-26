package cn.bootx.common.websocket.entity;

import cn.bootx.common.core.code.CommonCode;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
*
* @author xxm
* @date 2022/5/25
*/
@Data
@Accessors(chain = true)
public class WsResult implements Serializable {
    private static final long serialVersionUID = 2643141359685957800L;

    private int code = CommonCode.SUCCESS_CODE;
    private String data;
}

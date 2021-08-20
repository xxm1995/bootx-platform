package cn.bootx.goods.exception.inventory;

import cn.bootx.common.core.exception.BizException;

import static cn.bootx.goods.code.GoodsErrorCode.TOKEN_OUT_OF_DADE;

/**
* 库存Token已过期
* @author xxm
* @date 2020/11/23
*/
public class TokenOutOfDateException extends BizException {
    public TokenOutOfDateException() {
        super(TOKEN_OUT_OF_DADE, "库存Token已过期");
    }
}

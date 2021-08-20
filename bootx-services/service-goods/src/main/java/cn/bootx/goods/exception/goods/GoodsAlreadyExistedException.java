package cn.bootx.goods.exception.goods;


import cn.bootx.common.core.exception.BizException;

import static cn.bootx.goods.code.GoodsErrorCode.GOODS_ALREADY_EXISTED;

/**   
* 商品已存在异常
* @author xxm  
* @date 2020/11/20 
*/
public class GoodsAlreadyExistedException extends BizException {
    public GoodsAlreadyExistedException() {
        super(GOODS_ALREADY_EXISTED, "商品已经存在");
    }
}

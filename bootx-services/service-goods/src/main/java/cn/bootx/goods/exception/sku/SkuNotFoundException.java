package cn.bootx.goods.exception.sku;


import cn.bootx.common.core.exception.BizException;

import static cn.bootx.goods.code.GoodsErrorCode.GOODS_SKU_NOT_EXISTED;

/**   
* sku不存在
* @author xxm  
* @date 2020/12/10 
*/
public class SkuNotFoundException extends BizException {
    public SkuNotFoundException() {
        super(GOODS_SKU_NOT_EXISTED, "商品SKU不存在");
    }
}

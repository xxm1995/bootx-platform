package cn.bootx.goods.exception.sku;


import cn.bootx.common.core.exception.BizException;

import static cn.bootx.goods.code.GoodsErrorCode.GOODS_SKU_ALREADY_OFF;

/**
* 商品 SKU 已下架异常
* @author xxm
* @date 2020/11/24
*/
public class SkuAlreadyOffException extends BizException {
    public SkuAlreadyOffException() {
        super(GOODS_SKU_ALREADY_OFF, "商品 SKU 已下架异常");
    }
}

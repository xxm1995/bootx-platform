package cn.bootx.goods.exception.category;


import cn.bootx.common.core.exception.BizException;

import static cn.bootx.goods.code.GoodsErrorCode.CATEGORY_ALREADY_EXISTED;

/**
* 已存在异常
* @author xxm  
* @date 2020/11/20 
*/
public class CategoryAlreadyExistedException extends BizException {
    public CategoryAlreadyExistedException() {
        super(CATEGORY_ALREADY_EXISTED, "类别已经存在");
    }
}

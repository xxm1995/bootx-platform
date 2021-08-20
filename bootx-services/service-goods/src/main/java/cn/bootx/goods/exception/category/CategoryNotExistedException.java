package cn.bootx.goods.exception.category;


import cn.bootx.common.core.exception.BizException;

import java.io.Serializable;

import static cn.bootx.goods.code.GoodsErrorCode.CATEGORY_NOT_EXISTED;

/**   
* Category 不存在异常
* @author xxm  
* @date 2020/11/20 
*/
public class CategoryNotExistedException extends BizException implements Serializable {
    public CategoryNotExistedException() {
        super(CATEGORY_NOT_EXISTED, "类目不存在");
    }
}

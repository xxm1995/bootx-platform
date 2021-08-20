package cn.bootx.goods.exception.category;


import cn.bootx.common.core.exception.BizException;

import java.io.Serializable;

import static cn.bootx.goods.code.GoodsErrorCode.CATEGORY_ATTR_DEF_ALREADY_EXISTED;

/**
* 类别属性定义已存在
* @author xxm
* @date 2020/11/22
*/
public class CategoryAttrDefAlreadyExistedException extends BizException implements Serializable {
    public CategoryAttrDefAlreadyExistedException() {
        super(CATEGORY_ATTR_DEF_ALREADY_EXISTED, "类别属性定义已存在");
    }
}

package cn.bootx.baseapi.exception.dict;


import cn.bootx.common.core.exception.BizException;

import java.io.Serializable;

import static cn.bootx.baseapi.code.BspErrorCodes.CHILD_ITEM_EXISTED;


/**
* @author xxm
* @date 2020/4/16 22:08
*/
public class DictionaryChildItemExistedException extends BizException implements Serializable {
    private static final long serialVersionUID = -3964173905076738575L;

    public DictionaryChildItemExistedException() {
        super(CHILD_ITEM_EXISTED, "存在字典子项，您无法将其删除。");
    }
}

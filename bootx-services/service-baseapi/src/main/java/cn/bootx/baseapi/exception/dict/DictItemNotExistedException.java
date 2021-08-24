package cn.bootx.baseapi.exception.dict;


import cn.bootx.common.core.exception.BizException;

import java.io.Serializable;

import static cn.bootx.baseapi.code.BspErrorCodes.DICTIONARY_ITEM_NOT_EXISTED;


/**
* @author xxm
* @date 2020/4/21 11:54
*/
public class DictItemNotExistedException extends BizException implements Serializable {
    public DictItemNotExistedException() {
        super(DICTIONARY_ITEM_NOT_EXISTED, "字典项不存在.");
    }
}

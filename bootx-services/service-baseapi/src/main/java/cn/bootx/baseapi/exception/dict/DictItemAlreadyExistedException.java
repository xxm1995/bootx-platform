package cn.bootx.baseapi.exception.dict;


import cn.bootx.common.core.exception.BizException;

import java.io.Serializable;

import static cn.bootx.baseapi.code.BspErrorCodes.DICTIONARY_ITEM_ALREADY_EXISTED;


/**
* @author xxm
* @date 2020/4/21 11:53
*/
public class DictItemAlreadyExistedException extends BizException implements Serializable {
    public DictItemAlreadyExistedException() {
        super(DICTIONARY_ITEM_ALREADY_EXISTED, "字典项目已存在.");
    }
}

package cn.bootx.baseapi.exception.dict;

import cn.bootx.common.core.exception.BizException;
import java.io.Serializable;

import static cn.bootx.baseapi.code.BspErrorCodes.DICTIONARY_ITEM_ALREADY_USED;


/**
* @author xxm
* @date 2020/4/21 11:54
*/
public class DictionaryItemAlreadyUsedException extends BizException implements Serializable {
    public DictionaryItemAlreadyUsedException() {
        super(DICTIONARY_ITEM_ALREADY_USED, "词典项目已被使用.");
    }
}

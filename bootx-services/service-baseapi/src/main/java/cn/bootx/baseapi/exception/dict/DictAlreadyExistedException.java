package cn.bootx.baseapi.exception.dict;

import cn.bootx.common.core.exception.BizException;

import java.io.Serializable;

import static cn.bootx.baseapi.code.BspErrorCodes.DICTIONARY_ALREADY_EXISTED;

/**
 * @author xxm
 * @date 2020/4/10 15:14
 */
public class DictAlreadyExistedException extends BizException implements Serializable {

    public DictAlreadyExistedException() {
        super(DICTIONARY_ALREADY_EXISTED, "字典已经存在.");
    }

}

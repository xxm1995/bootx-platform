package cn.bootx.baseapi.handler.dict;

import cn.bootx.common.core.annotation.TranslationResult;

import java.lang.reflect.Type;

/**
 * 字典值翻译接口
 * @author xxm
 * @date 2022/12/20
 */
public interface DictTranslationHandler {

    /**
     * 匹配
     */
    /**
     * openId类型是否匹配
     */
    boolean adaptation(Type type);

    /**
     * 翻译
     */
    void translation(Object object, Type type, TranslationResult translationResult);


}

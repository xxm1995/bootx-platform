package cn.bootx.common.translate.service;

import java.util.Map;

/**
 *
 * @author xxm
 * @date 2023/1/29
 */
public interface DictTranslationService {
    /**
     * 字典值字段翻译转换
     */
    void translation(Object object);

    /**
     * 字典值字段翻译转换
     */
    void translation(Iterable<?> objects);

    /**
     * 字典值字段翻译转换
     */
    Map<String, Object> translationToMap(Object o);

    /**
     * 字典值字段翻译转换
     */
    Iterable<Map<String, Object>> translationToMap(Iterable<?> objects);
}

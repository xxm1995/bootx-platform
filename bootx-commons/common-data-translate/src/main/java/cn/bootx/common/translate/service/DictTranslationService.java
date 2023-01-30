package cn.bootx.common.translate.service;

/**
 *
 * @author xxm
 * @date 2023/1/29
 */
public interface DictTranslationService {
    /**
     * 字典值字段翻译转换
     */
    String translation(String dicCode, String fieldValue);
}

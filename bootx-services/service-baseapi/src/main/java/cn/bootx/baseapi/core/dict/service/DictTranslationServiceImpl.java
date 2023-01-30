package cn.bootx.baseapi.core.dict.service;

import cn.bootx.common.translate.service.DictTranslationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * 字典值转换工具类
 * @author xxm
 * @date 2022/12/15
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class DictTranslationServiceImpl implements DictTranslationService {
    private final DictionaryItemService dictionaryItemService;

    /**
     * 字典值字段翻译转换
     *
     * @param dicCode
     * @param fieldValue
     */
    @Override
    public String translation(String dicCode, String fieldValue) {
        return "null";
    }
}

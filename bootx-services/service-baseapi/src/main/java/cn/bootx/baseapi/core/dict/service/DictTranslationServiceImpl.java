package cn.bootx.baseapi.core.dict.service;

import cn.bootx.baseapi.core.dict.entity.DictionaryItem;
import cn.bootx.baseapi.dto.dict.DictionaryItemDto;
import cn.bootx.baseapi.dto.dict.DictionaryItemSimpleDto;
import cn.bootx.common.core.function.CollectorsFunction;
import cn.bootx.common.translate.cache.TranslationCacheLocal;
import cn.bootx.common.translate.service.DictTranslationService;
import com.google.common.base.Objects;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

import static cn.bootx.common.translate.cache.TranslationCacheLocal.get;

/**
 * 字典值转换工具类
 *
 * @author xxm
 * @date 2022/12/15
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class DictTranslationServiceImpl implements DictTranslationService {

    private final DictionaryItemService dictionaryItemService;

    /**
     * 初始化字典值字段翻译缓存
     */
    @Override
    public void initDictTranslationCache() {
        TranslationCacheLocal.Cache cache = get();
        val dictItems = cache.getDictItems();
        // 如果字典项少于三个, 单独查, 字典类型少于三个, 查找项后本地筛选, 其他查全部后筛选
        long itemCount = dictItems.stream().distinct().count();
        long dictCount = dictItems.stream().map(TranslationCacheLocal.DictItem::getDictCode).distinct().count();
        if (itemCount <= 3) {
            val collect = dictItems.stream().distinct().collect(Collectors.toList());
            for (val dictItem : collect) {
                String value = dictionaryItemService.findEnableByCode(dictItem.getDictCode(), dictItem.getCode())
                        .map(DictionaryItem::getName).orElse(null);
                cache.addDictCache(dictItem.getDictCode(), dictItem.getCode(), value);
            }
        }
        else if (dictCount < 3) {
            val dictCodes = dictItems.stream().map(TranslationCacheLocal.DictItem::getDictCode)
                    .collect(Collectors.toList());
            for (val dictCode : dictCodes) {
                Map<String, DictionaryItemDto> itemMap = dictionaryItemService.findEnableByDictCode(dictCode).stream()
                        .collect(Collectors.toMap(DictionaryItemDto::getCode, Function.identity(),
                                CollectorsFunction::retainLatest));
                val collect = dictItems.stream().filter(item -> Objects.equal(dictCode, item.getDictCode()))
                        .collect(Collectors.toList());
                for (val dictItem : collect) {
                    String value = Optional.ofNullable(itemMap.get(dictItem.getCode())).map(DictionaryItemDto::getName)
                            .orElse(null);
                    cache.addDictCache(dictItem.getDictCode(), dictItem.getCode(), value);
                }
            }
        }
        else {
            val allDictItems = dictionaryItemService.findAllByEnable();
            for (val dictItem : dictItems) {
                String value = allDictItems.stream()
                        .filter(o -> Objects.equal(dictItem.getDictCode(), o.getDictCode())
                                && Objects.equal(dictItem.getCode(), o.getCode()))
                        .findFirst().map(DictionaryItemSimpleDto::getName).orElse(null);
                cache.addDictCache(dictItem.getDictCode(), dictItem.getCode(), value);
            }
        }
    }

}

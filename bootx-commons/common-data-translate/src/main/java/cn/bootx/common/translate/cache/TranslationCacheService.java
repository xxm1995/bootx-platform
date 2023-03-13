package cn.bootx.common.translate.cache;

import cn.bootx.common.core.annotation.Translate;
import cn.bootx.common.core.annotation.TranslationResult;
import cn.bootx.common.translate.cache.TranslationCacheLocal.Cache;
import cn.bootx.common.translate.domain.ConvertInfo;
import cn.bootx.common.translate.service.DictTranslationService;
import cn.hutool.core.annotation.AnnotationUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ClassUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author xxm
 * @date 2023/1/30
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class TranslationCacheService {

    private final DictTranslationService dictTranslationService;

    public void initCache(Collection<?> objects) {
        objects.forEach(this::initCache0);
        this.cacheTranslation();
    }

    public void initCache(Object object) {
        this.initCache0(object);
        this.cacheTranslation();
    }

    /**
     * 提取要缓存的数据
     */
    private void initCache0(Object object) {
        if (Objects.isNull(object)) {
            return;
        }
        // 遍历字段, 判断是否有嵌套对象
        List<ConvertInfo> list = Arrays.stream(BeanUtil.getPropertyDescriptors(object.getClass())).map(this::initCache0)
                .collect(Collectors.toList());
        // 加注解的嵌套对象进行递归处理
        List<ConvertInfo> translationResults = list.stream().filter(o -> Objects.nonNull(o.getTranslationResult()))
                .collect(Collectors.toList());
        for (ConvertInfo translationResult : translationResults) {
            Object fieldValue = BeanUtil.getFieldValue(object, translationResult.getName());
            if (Objects.nonNull(fieldValue)) {
                // 是否是集合
                if (fieldValue instanceof Collection) {
                    ((Collection<?>) fieldValue).forEach(this::initCache0);
                }
                this.initCache0(fieldValue);
            }
        }
        for (ConvertInfo convertInfo : list) {
            Object fieldValue = BeanUtil.getFieldValue(object, convertInfo.getField().getName());
            Translate translate = convertInfo.getTranslate();
            if (Objects.isNull(fieldValue) || Objects.isNull(translate)) {
                continue;
            }
            // 集合处理
            if (fieldValue instanceof Collection) {
                ((Collection<?>) fieldValue).forEach(o -> this.addCacheInfo(translate, o));
            }
            else {
                this.addCacheInfo(translate, fieldValue);
            }
        }
    }

    /**
     * 添加到缓存列表
     */
    private void addCacheInfo(Translate translate, Object fieldValue) {
        Cache cache = TranslationCacheLocal.get();
        switch (translate.type()) {
            case DICT:
                cache.addDict(translate.dicCode(), fieldValue.toString());
                break;
            case TABLE:
                break;
        }
    }

    /**
     * 初始化转换字段元信息
     */
    private ConvertInfo initCache0(PropertyDescriptor descriptor) {
        Field field = ClassUtil.getDeclaredField(descriptor.getReadMethod().getDeclaringClass(), descriptor.getName());
        Translate translate = AnnotationUtil.getAnnotation(field, Translate.class);
        TranslationResult translationResult = AnnotationUtil.getAnnotation(field, TranslationResult.class);

        return new ConvertInfo().setName(descriptor.getName()).setField(field).setTranslate(translate)
                .setTranslationResult(translationResult);
    }

    /**
     * 初始化缓存翻译
     */
    private void cacheTranslation() {
        // 字典值缓存初始化
        dictTranslationService.initDictTranslationCache();
        // 数据表缓存初始化
    }

}

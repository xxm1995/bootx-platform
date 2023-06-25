package cn.bootx.platform.common.translate.service;

import cn.bootx.platform.common.core.annotation.Translate;
import cn.bootx.platform.common.core.annotation.TranslationResult;
import cn.bootx.platform.common.core.function.CollectorsFunction;
import cn.bootx.platform.common.translate.cache.TranslationCacheLocal;
import cn.bootx.platform.common.translate.cache.TranslationCacheLocal.Cache;
import cn.bootx.platform.common.translate.cache.TranslationCacheService;
import cn.bootx.platform.common.translate.domain.ConvertInfo;
import cn.hutool.core.annotation.AnnotationUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ClassUtil;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collector;
import java.util.stream.Collectors;

/**
 * 翻译服务
 *
 * @author xxm
 * @since 2023/1/29
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class FieldTranslationService {

    private final TranslationCacheService translationCacheService;

    /**
     * 字典值字段翻译转换
     */
    public void translation(Collection<?> objects) {
        translationCacheService.initCache(objects);
        objects.forEach(this::translation0);
    }

    public void translation(Object object) {
        translationCacheService.initCache(object);
        this.translation0(object);
    }

    /**
     * 字典值字段翻译转换
     */
    private void translation0(Object object) {
        if (Objects.isNull(object)) {
            return;
        }
        // 遍历字段, 判断是否有嵌套对象
        List<ConvertInfo> list = Arrays.stream(BeanUtil.getPropertyDescriptors(object.getClass()))
            .map(this::initConvertInfo)
            .collect(Collectors.toList());
        // 加注解的嵌套对象进行递归处理
        List<ConvertInfo> translationResults = list.stream()
            .filter(o -> Objects.nonNull(o.getTranslationResult()))
            .collect(Collectors.toList());
        for (ConvertInfo translationResult : translationResults) {
            Object fieldValue = BeanUtil.getFieldValue(object, translationResult.getName());
            if (Objects.nonNull(fieldValue)) {
                // 是否是集合
                if (fieldValue instanceof Collection) {
                    ((Collection<?>) fieldValue).forEach(this::translation0);
                }
                this.translation0(fieldValue);
            }
        }
        // 筛选出带翻译注解的进行字段翻译
        list.stream()
            .filter(o -> Objects.nonNull(o.getTranslate()))
            .peek(convertInfo -> isAndGetFieldType(convertInfo, object))
            .forEach(o -> this.translation0(o, object));
    }

    /**
     * 翻译前和翻译后的类型是否一致
     */
    private Class<?> isAndGetFieldType(ConvertInfo convertInfo, Object convertObject) {
        Translate translate = convertInfo.getTranslate();
        // 直接在当前字段上进行转换才进行处理
        if (StrUtil.isAllBlank(translate.source(), translate.target())) {
            Object fieldValue = BeanUtil.getFieldValue(convertObject, convertInfo.getName());
            if (!Objects.isNull(fieldValue)) {
                Object value = this.getTranslationValue(translate, fieldValue);
                if (Objects.nonNull(value)
                        && !ClassUtil.isAssignable(convertInfo.getField().getType(), value.getClass())) {
                    return value.getClass();
                }
            }
        }
        return null;
    }

    /**
     * 字典转换
     * @param convertInfo 转换所需的元信息
     * @param convertObject 要进行字典转换的对象
     */
    private void translation0(ConvertInfo convertInfo, Object convertObject) {
        Translate translate = convertInfo.getTranslate();
        // 直接在当前字段上进行转换
        if (StrUtil.isAllBlank(translate.source(), translate.target())) {
            Object fieldValue = BeanUtil.getFieldValue(convertObject, convertInfo.getName());
            if (!Objects.isNull(fieldValue)) {
                Object dictValue = this.getTranslationValue(translate, fieldValue);
                this.setFieldValue(convertObject, convertInfo.getName(), dictValue);
            }
        }
        // 通过配置的源字段进行转换并赋值到当前字段
        if (StrUtil.isNotBlank(translate.source())) {
            Object fieldValue = BeanUtil.getFieldValue(convertObject, translate.source());
            if (!Objects.isNull(fieldValue)) {
                Object dictValue = this.getTranslationValue(translate, fieldValue);
                this.setFieldValue(convertObject, convertInfo.getName(), dictValue);
            }
        }
        // 将当前字段转换到其他字段上
        if (StrUtil.isNotBlank(translate.target())) {
            Object fieldValue = BeanUtil.getFieldValue(convertObject, convertInfo.getName());
            if (!Objects.isNull(fieldValue)) {
                Object dictValue = this.getTranslationValue(translate, fieldValue);
                this.setFieldValue(convertObject, translate.target(), dictValue);
            }
        }
    }

    /**
     * 初始化转换字段元信息
     */
    private ConvertInfo initConvertInfo(PropertyDescriptor descriptor) {
        Field field = ClassUtil.getDeclaredField(descriptor.getReadMethod().getDeclaringClass(), descriptor.getName());
        Translate translate = AnnotationUtil.getAnnotation(field, Translate.class);
        TranslationResult translationResult = AnnotationUtil.getAnnotation(field, TranslationResult.class);

        return new ConvertInfo().setName(descriptor.getName())
            .setField(field)
            .setTranslate(translate)
            .setTranslationResult(translationResult);
    }

    /**
     * 转换成map
     */
    public Collection<Map<String, Object>> translationToMap(Collection<?> objects) {
        translationCacheService.initCache(objects);
        return objects.stream().map((Object o) -> this.translationToMap0(o)).collect(Collectors.toList());
    }

    /**
     * 翻译后并转换成Map对象
     * @param object 要翻译转换的对象
     * @return 转换后的Map对象
     */
    public Map<String, Object> translationToMap(Object object) {
        translationCacheService.initCache(object);
        return this.translationToMap0(object);
    }

    /**
     * 翻译后并转换成Map对象
     * @param object 要翻译转换的对象
     * @return 转换后的Map对象
     */
    private Map<String, Object> translationToMap0(Object object) {
        if (Objects.isNull(object)) {
            return null;
        }
        translationCacheService.initCache(object);
        // 转换后的对象
        Map<String, Object> map = BeanUtil.beanToMap(object);

        // 遍历字段, 判断是否有嵌套对象
        Map<String, ConvertInfo> convertInfoMap = Arrays.stream(BeanUtil.getPropertyDescriptors(object.getClass()))
            .map(this::initConvertInfo)
            .collect(Collectors.toMap(ConvertInfo::getName, Function.identity(), CollectorsFunction::retainLatest));

        // 加注解的嵌套对象进行递归处理
        convertInfoMap.values().stream().filter(o -> Objects.nonNull(o.getTranslationResult())).forEach(o -> {
            Object fieldValue = BeanUtil.getFieldValue(object, o.getName());
            if (Objects.nonNull(fieldValue)) {
                // 将转换后的Map进行赋值
                map.put(o.getName(), this.translationToMap0(fieldValue));
            }
        });

        // 筛选出带翻译注解的进行字段翻译转换
        convertInfoMap.values()
            .stream()
            .filter(o -> Objects.nonNull(o.getTranslate()))
            .forEach(o -> this.translationToMap0(o, object, map));
        return map;
    }

    /**
     * 字典转换
     * @param convertInfo 转换所需的元信息
     * @param convertObject 要进行字典转换的对象
     * @param map 要写入的map对象
     */
    private void translationToMap0(ConvertInfo convertInfo, Object convertObject, Map<String, Object> map) {
        Translate translate = convertInfo.getTranslate();
        // 直接在当前字段上进行转换
        if (StrUtil.isAllBlank(translate.source(), translate.target())) {
            Object fieldValue = BeanUtil.getFieldValue(convertObject, convertInfo.getName());
            if (!Objects.isNull(fieldValue)) {
                Object dictValue = this.getTranslationValue(translate, fieldValue);
                map.put(convertInfo.getName(), dictValue);
            }
        }
        // 通过配置的源字段进行转换并赋值到当前字段
        if (StrUtil.isNotBlank(translate.source())) {
            Object fieldValue = BeanUtil.getFieldValue(convertObject, translate.source());
            if (!Objects.isNull(fieldValue)) {
                Object dictValue = this.getTranslationValue(translate, fieldValue);
                map.put(convertInfo.getName(), dictValue);
            }
        }
        // 将当前字段转换到其他字段上
        if (StrUtil.isNotBlank(translate.target())) {
            Object fieldValue = BeanUtil.getFieldValue(convertObject, convertInfo.getName());
            if (!Objects.isNull(fieldValue)) {
                Object dictValue = this.getTranslationValue(translate, fieldValue);
                map.put(translate.target(), dictValue);
            }
        }
    }

    /**
     * 获取翻译值
     */
    private Object getTranslationValue(Translate translate, Object fieldValue) {
        // 集合
        if (fieldValue instanceof Collection) {
            return ((Collection<?>) fieldValue).stream()
                .map(o -> this.getTranslationValue(translate, o))
                .collect(getCollectorType(fieldValue));
        }

        // 普通
        switch (translate.type()) {
            case DICT:
                return this.getDictValue(translate, fieldValue.toString());
            case TABLE:
                return this.getTableValue(translate, fieldValue);
            default:
                return null;
        }
    }

    /**
     * 字典取值
     */
    private String getDictValue(Translate translate, String fieldValue) {
        Cache cache = TranslationCacheLocal.get();
        String dicCode = translate.dicCode();
        return cache.getDictValue(dicCode, fieldValue);
    }

    /**
     * 数据表取值
     */
    private Object getTableValue(Translate translate, Object fieldValue) {
        Cache cache = TranslationCacheLocal.get();

        return "cache.getTableValue()";
    }

    /**
     * 赋值
     */
    private void setFieldValue(Object bean, String fieldNameOrIndex, Object value) {
        try {
            BeanUtil.setFieldValue(bean, fieldNameOrIndex, value);
        }
        catch (Exception e) {
            log.warn("类 {} 的 字段名称或下标: {}，赋值错误，可能是值类型与字段类型不匹配", bean.getClass().getName(), fieldNameOrIndex);
        }
    }

    /**
     * 获取集合类型
     */
    private Collector<Object, ?, ?> getCollectorType(Object fieldValue) {
        if (fieldValue instanceof Set) {
            return Collectors.toSet();
        }
        return Collectors.toList();
    }

}

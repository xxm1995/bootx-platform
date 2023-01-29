package cn.bootx.common.translate.service;

import cn.bootx.common.core.annotation.Translate;
import cn.bootx.common.core.annotation.TranslationResult;
import cn.hutool.core.annotation.AnnotationUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ClassUtil;
import cn.hutool.core.util.StrUtil;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 翻译服务
 * @author xxm
 * @date 2023/1/29
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class FieldTranslationService {

    /**
     * 字典值字段翻译转换
     */
    public void translation(Iterable<?> objects){
        objects.forEach(object -> this.translation(object));
    }

    /**
     * 字典值字段翻译转换
     */
    public void translation(Object object){
        if (Objects.isNull(object)){
            return;
        }

        // 遍历字段, 判断是否有嵌套对象
        Map<String, DictConvertInfo> convertInfoMap = Arrays.stream(BeanUtil.getPropertyDescriptors(object.getClass()))
                .map(this::initConvertInfo)
                .collect(Collectors.toMap(DictConvertInfo::getName, Function.identity(), (o1, o2) -> o2));
        // 加注解的嵌套对象进行递归处理
        convertInfoMap.values().stream()
                .filter(o-> Objects.nonNull(o.getTranslationResult()))
                .forEach(o->{
                    Object fieldValue = BeanUtil.getFieldValue(object, o.getName());
                    if (Objects.nonNull(fieldValue)){
                        this.translation(fieldValue);
                    }
                });

        // 筛选出带翻译注解的进行字段翻译
        convertInfoMap.values().stream()
                .filter(o-> Objects.nonNull(o.getTranslate()))
                .forEach(o-> this.translation(o,object));
    }

    /**
     * 字典转换
     * @param convertInfo 转换所需的元信息
     * @param convertObject 要进行字典转换的对象
     */
    private void translation(DictConvertInfo convertInfo, Object convertObject){
        Translate translate = convertInfo.getTranslate();
        // 直接在当前字段上进行转换
        if (StrUtil.isAllBlank(translate.source(), translate.target())){
            Object fieldValue = BeanUtil.getFieldValue(convertObject, convertInfo.getName());
            if (!StrUtil.isBlankIfStr(fieldValue)){
                String dictValue = this.getTranslationValue(translate.dicCode(), fieldValue.toString());
                BeanUtil.setFieldValue(convertObject,convertInfo.getName(), dictValue);
            }
        }
        // 通过配置的源字段进行转换并赋值到当前字段
        if (StrUtil.isNotBlank(translate.source())){
            Object fieldValue = BeanUtil.getFieldValue(convertObject, translate.source());
            if (!StrUtil.isBlankIfStr(fieldValue)){
                String dictValue = this.getTranslationValue(translate.dicCode(), fieldValue.toString());
                BeanUtil.setFieldValue(convertObject,convertInfo.getName(), dictValue);
            }
        }
        // 将当前字段转换到其他字段上
        if (StrUtil.isNotBlank(translate.target())){
            Object fieldValue = BeanUtil.getFieldValue(convertObject, convertInfo.getName());
            if (!StrUtil.isBlankIfStr(fieldValue)){
                String dictValue = this.getTranslationValue(translate.dicCode(), fieldValue.toString());
                BeanUtil.setFieldValue(convertObject, translate.target(), dictValue);
            }
        }
    }

    /**
     * 初始化转换字段元信息
     */
    private DictConvertInfo initConvertInfo(PropertyDescriptor descriptor){
        Field field = ClassUtil.getDeclaredField(descriptor.getReadMethod().getDeclaringClass(), descriptor.getName());
        Translate translate = AnnotationUtil.getAnnotation(field, Translate.class);
        TranslationResult translationResult = AnnotationUtil.getAnnotation(field, TranslationResult.class);

        return new DictConvertInfo()
                .setName(descriptor.getName())
                .setField(field)
                .setTranslate(translate)
                .setTranslationResult(translationResult);
    }

    /**
     * 转换成map
     */
    public Collection<Map<String,Object>> translationToMap(Collection<?> objects){
        return objects.stream().map((Object o)->this.translationToMap(o)).collect(Collectors.toList());
    }

    /**
     * 翻译后并转换成Map对象
     * @param object 要翻译转换的对象
     * @return 转换后的Map对象
     */
    private Map<String,Object> translationToMap(Object object){
        if (Objects.isNull(object)){
            return null;
        }
        // 转换后的对象
        Map<String, Object> map = BeanUtil.beanToMap(object);

        // 遍历字段, 判断是否有嵌套对象
        Map<String, DictConvertInfo> convertInfoMap = Arrays.stream(BeanUtil.getPropertyDescriptors(object.getClass()))
                .map(this::initConvertInfo)
                .collect(Collectors.toMap(DictConvertInfo::getName, Function.identity(), (o1, o2) -> o2));

        // 加注解的嵌套对象进行递归处理
        convertInfoMap.values().stream()
                .filter(o-> Objects.nonNull(o.getTranslationResult()))
                .forEach(o->{
                    Object fieldValue = BeanUtil.getFieldValue(object, o.getName());
                    if (Objects.nonNull(fieldValue)){
                        // 将转换后的Map进行赋值
                        map.put(o.getName(),this.translationToMap(fieldValue));
                    }
                });

        // 筛选出带翻译注解的进行字段翻译转换
        convertInfoMap.values().stream()
                .filter(o-> Objects.nonNull(o.getTranslate()))
                .forEach(o-> this.translationToMap(o,object,map));
        return map;
    }

    /**
     * 字典转换
     * @param convertInfo 转换所需的元信息
     * @param convertObject 要进行字典转换的对象
     * @param map 要写入的map对象
     * @param dictItems 字典列表
     */
    private void translationToMap(DictConvertInfo convertInfo, Object convertObject, Map<String,Object> map) {
        Translate translate = convertInfo.getTranslate();
        // 直接在当前字段上进行转换
        if (StrUtil.isAllBlank(translate.source(), translate.target())){
            Object fieldValue = BeanUtil.getFieldValue(convertObject, convertInfo.getName());
            if (!StrUtil.isBlankIfStr(fieldValue)){
                String dictValue = this.getTranslationValue(translate.dicCode(), fieldValue.toString());
                map.put(convertInfo.getName(), dictValue);
            }
        }
        // 通过配置的源字段进行转换并赋值到当前字段
        if (StrUtil.isNotBlank(translate.source())){
            Object fieldValue = BeanUtil.getFieldValue(convertObject, translate.source());
            if (!StrUtil.isBlankIfStr(fieldValue)){
                String dictValue = this.getTranslationValue(translate.dicCode(), fieldValue.toString());
                map.put(convertInfo.getName(), dictValue);
            }
        }
        // 将当前字段转换到其他字段上
        if (StrUtil.isNotBlank(translate.target())){
            Object fieldValue = BeanUtil.getFieldValue(convertObject, convertInfo.getName());
            if (!StrUtil.isBlankIfStr(fieldValue)){
                String dictValue = this.getTranslationValue(translate.dicCode(), fieldValue.toString());
                map.put(translate.target(), dictValue);
            }
        }
    }

    /**
     * 获取翻译值
     */
    private String getTranslationValue(String dictCode, String dictItemCode,Translate translate){
        switch (translate.type()) {
            case DICT:
                break;
            case TABLE:
                break;
            case ENUM:
                break;
        }
        return dictItems.stream()
                .filter(o->Objects.equals(o.getDictCode(),dictCode) && Objects.equals(o.getCode(),dictItemCode))
                .findFirst()
                .map(DictionaryItemSimpleDto::getName)
                .orElse(null);
    }

    /**
     * 字典转换信息
     */
    @Getter
    @Setter
    @Accessors(chain = true)
    private static class DictConvertInfo{
        // 字段名
        private String name;
        // 所属字段属性
        private Field field;
        // 翻译注解
        private Translate translate;
        // 嵌套翻译注解
        private TranslationResult translationResult;
    }
}

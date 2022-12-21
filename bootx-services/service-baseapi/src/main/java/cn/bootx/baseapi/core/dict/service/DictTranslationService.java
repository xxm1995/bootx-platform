package cn.bootx.baseapi.core.dict.service;

import cn.bootx.baseapi.dto.dict.DictionaryItemSimpleDto;
import cn.bootx.common.core.annotation.Dict;
import cn.bootx.common.core.annotation.DictTranslation;
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
 * 字典值转换工具类
 * @author xxm
 * @date 2022/12/15
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class DictTranslationService {
    private final DictionaryItemService dictionaryItemService;


    /**
     * 字典值字段翻译转换
     */
    public void translation(Object object){
        List<DictionaryItemSimpleDto> dictItems = dictionaryItemService.findAllByEnable();
        this.translation(object,dictItems);
    }

    /**
     * 字典值字段翻译转换
     */
    public void translation(Iterable<?> objects){
        List<DictionaryItemSimpleDto> dictItems = dictionaryItemService.findAllByEnable();
        objects.forEach(object -> this.translation(object,dictItems));
    }

    /**
     * 转换
     */
    private void translation(Object object, List<DictionaryItemSimpleDto> dictItems){
        if (Objects.isNull(object)){
            return;
        }

        // 遍历字段, 判断是否有嵌套对象
        Map<String, DictConvertInfo> convertInfoMap = Arrays.stream(BeanUtil.getPropertyDescriptors(object.getClass()))
                .map(this::initConvertInfo)
                .collect(Collectors.toMap(DictConvertInfo::getName, Function.identity(), (o1, o2) -> o2));
        // 加注解的嵌套对象进行递归处理
        convertInfoMap.values().stream()
                .filter(o-> Objects.nonNull(o.getDictTranslation()))
                .forEach(o->{
                    Object fieldValue = BeanUtil.getFieldValue(object, o.getName());
                    if (Objects.nonNull(fieldValue)){
                        this.translation(fieldValue,dictItems);
                    }
                });

        // 筛选出带翻译注解的进行字段翻译
        convertInfoMap.values().stream()
                .filter(o-> Objects.nonNull(o.getDict()))
                .forEach(o-> this.translation(o,object,dictItems));
    }

    /**
     * 字典转换
     * @param convertInfo 转换所需的元信息
     * @param convertObject 要进行字典转换的对象
     * @param dictItems 字典列表
     */
    private void translation(DictConvertInfo convertInfo, Object convertObject, List<DictionaryItemSimpleDto> dictItems){
        Dict dict = convertInfo.getDict();
        // 直接在当前字段上进行转换
        if (StrUtil.isAllBlank(dict.source(), dict.target())){
            Object fieldValue = BeanUtil.getFieldValue(convertObject, convertInfo.getName());
            if (!StrUtil.isBlankIfStr(fieldValue)){
                String dictValue = this.getDictValue(dict.dicCode(), fieldValue.toString(), dictItems);
                BeanUtil.setFieldValue(convertObject,convertInfo.getName(), dictValue);
            }
        }
        // 通过配置的源字段进行转换并赋值到当前字段
        if (StrUtil.isNotBlank(dict.source())){
            Object fieldValue = BeanUtil.getFieldValue(convertObject, dict.source());
            if (!StrUtil.isBlankIfStr(fieldValue)){
                String dictValue = this.getDictValue(dict.dicCode(), fieldValue.toString(), dictItems);
                BeanUtil.setFieldValue(convertObject,convertInfo.getName(), dictValue);
            }
        }
        // 将当前字段转换到其他字段上
        if (StrUtil.isNotBlank(dict.target())){
            Object fieldValue = BeanUtil.getFieldValue(convertObject, convertInfo.getName());
            if (!StrUtil.isBlankIfStr(fieldValue)){
                String dictValue = this.getDictValue(dict.dicCode(), fieldValue.toString(), dictItems);
                BeanUtil.setFieldValue(convertObject, dict.target(), dictValue);
            }
        }
    }

    /**
     * 初始化转换字段元信息
     */
    private DictConvertInfo initConvertInfo(PropertyDescriptor descriptor){
        Field field = ClassUtil.getDeclaredField(descriptor.getReadMethod().getDeclaringClass(), descriptor.getName());
        Dict dict = AnnotationUtil.getAnnotation(field, Dict.class);
        DictTranslation dictTranslation = AnnotationUtil.getAnnotation(field, DictTranslation.class);

        return new DictConvertInfo()
                .setName(descriptor.getName())
                .setField(field)
                .setDict(dict)
                .setDictTranslation(dictTranslation);
    }

    /**
     * 转换成map
     */
    public Map<String,Object> translationToMap(Object o){
        List<DictionaryItemSimpleDto> dictItems = dictionaryItemService.findAllByEnable();
        return this.translationToMap(o,dictItems);
    }

    /**
     * 转换成map
     */
    public Iterable<Map<String,Object>> translationToMap(Iterable<?> objects){
        List<DictionaryItemSimpleDto> dictItems = dictionaryItemService.findAllByEnable();
        return dictItems.stream().map(o->this.translationToMap(o,dictItems)).collect(Collectors.toList());
    }

    /**
     * 翻译后并转换成Map对象
     * @param object 要翻译转换的对象
     * @param dictItems 字典列表
     * @return 转换后的Map对象
     */
    private Map<String,Object> translationToMap(Object object,List<DictionaryItemSimpleDto> dictItems){
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
                .filter(o-> Objects.nonNull(o.getDictTranslation()))
                .forEach(o->{
                    Object fieldValue = BeanUtil.getFieldValue(object, o.getName());
                    if (Objects.nonNull(fieldValue)){
                        // 将转换后的Map进行赋值
                        map.put(o.getName(),this.translationToMap(fieldValue,dictItems));
                    }
                });

        // 筛选出带翻译注解的进行字段翻译转换
        convertInfoMap.values().stream()
                .filter(o-> Objects.nonNull(o.getDict()))
                .forEach(o-> this.translationToMap(o,object,map,dictItems));
        return map;
    }

    /**
     * 字典转换
     * @param convertInfo 转换所需的元信息
     * @param convertObject 要进行字典转换的对象
     * @param map 要写入的map对象
     * @param dictItems 字典列表
     */
    private void translationToMap(DictConvertInfo convertInfo, Object convertObject, Map<String,Object> map, List<DictionaryItemSimpleDto> dictItems) {
        Dict dict = convertInfo.getDict();
        // 直接在当前字段上进行转换
        if (StrUtil.isAllBlank(dict.source(), dict.target())){
            Object fieldValue = BeanUtil.getFieldValue(convertObject, convertInfo.getName());
            if (!StrUtil.isBlankIfStr(fieldValue)){
                String dictValue = this.getDictValue(dict.dicCode(), fieldValue.toString(), dictItems);
                map.put(convertInfo.getName(), dictValue);
            }
        }
        // 通过配置的源字段进行转换并赋值到当前字段
        if (StrUtil.isNotBlank(dict.source())){
            Object fieldValue = BeanUtil.getFieldValue(convertObject, dict.source());
            if (!StrUtil.isBlankIfStr(fieldValue)){
                String dictValue = this.getDictValue(dict.dicCode(), fieldValue.toString(), dictItems);
                map.put(convertInfo.getName(), dictValue);
            }
        }
        // 将当前字段转换到其他字段上
        if (StrUtil.isNotBlank(dict.target())){
            Object fieldValue = BeanUtil.getFieldValue(convertObject, convertInfo.getName());
            if (!StrUtil.isBlankIfStr(fieldValue)){
                String dictValue = this.getDictValue(dict.dicCode(), fieldValue.toString(), dictItems);
                map.put(dict.target(), dictValue);
            }
        }
    }

    /**
     * 获取字典值
     */
    private String getDictValue(String dictCode, String dictItemCode, List<DictionaryItemSimpleDto> dictItems){
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
        private Dict dict;
        // 嵌套翻译注解
        private DictTranslation dictTranslation;
    }
}

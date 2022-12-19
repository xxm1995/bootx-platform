package cn.bootx.baseapi.core.dict.service;

import cn.bootx.baseapi.dto.dict.DictionaryItemSimpleDto;
import cn.bootx.common.core.annotation.DictConvert;
import cn.bootx.common.core.annotation.DictConvertModel;
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
public class DictConvertService {
    private final DictionaryItemService dictionaryItemService;


    /**
     * 字典值字段翻译转换
     */
    public void convert(Object object){
        List<DictionaryItemSimpleDto> dictItems = dictionaryItemService.findAllByEnable();
        this.convert(object,dictItems);
    }

    /**
     * 转换
     */
    private void convert(Object object, List<DictionaryItemSimpleDto> dictItems){
        // 遍历字段, 判断是否有嵌套对象
        Map<String, DictConvertInfo> convertInfoMap = Arrays.stream(BeanUtil.getPropertyDescriptors(object.getClass()))
                .map(this::initConvertInfo)
                .collect(Collectors.toMap(DictConvertInfo::getName, Function.identity(), (o1, o2) -> o2));
        // 加注解的对象进行递归处理
        convertInfoMap.values().stream()
                .filter(o-> Objects.nonNull(o.getDictConvertModel()))
                        .forEach(o->{
                            Object fieldValue = BeanUtil.getFieldValue(object, o.getName());
                            if (Objects.nonNull(fieldValue)){
                                this.convert(fieldValue,dictItems);
                            }
                        });

        // 筛选出带翻译注解的进行字段翻译
        convertInfoMap.values().stream()
                .filter(o-> Objects.nonNull(o.getDictConvert()))
                .forEach(o-> this.convert(o,object,dictItems));
    }

    /**
     * 字典转换
     * @param convertInfo 转换所需的元信息
     * @param convertObject 要进行字典转换的对象
     * @param dictItems 字典列表
     */
    private void convert(DictConvertInfo convertInfo,Object convertObject,List<DictionaryItemSimpleDto> dictItems){
        DictConvert dictConvert = convertInfo.getDictConvert();
        // 直接在当前字段上进行转换
        if (StrUtil.isAllBlank(dictConvert.source(),dictConvert.target())){
            Object fieldValue = BeanUtil.getFieldValue(convertObject, convertInfo.getName());
            if (!StrUtil.isBlankIfStr(fieldValue)){
                String dictValue = this.getDictValue(dictConvert.dicCode(), fieldValue.toString(), dictItems);
                BeanUtil.setFieldValue(convertObject,convertInfo.getName(), dictValue);
            }
        }
        // 通过配置的源字段进行转换并赋值到当前字段
        if (StrUtil.isNotBlank(dictConvert.source())){
            Object fieldValue = BeanUtil.getFieldValue(convertObject, dictConvert.source());
            if (!StrUtil.isBlankIfStr(fieldValue)){
                String dictValue = this.getDictValue(dictConvert.dicCode(), fieldValue.toString(), dictItems);
                BeanUtil.setFieldValue(convertObject,convertInfo.getName(), dictValue);
            }
        }
        // 将当前字段转换到其他字段上
        if (StrUtil.isNotBlank(dictConvert.target())){
            Object fieldValue = BeanUtil.getFieldValue(convertObject, convertInfo.getName());
            if (!StrUtil.isBlankIfStr(fieldValue)){
                String dictValue = this.getDictValue(dictConvert.dicCode(), fieldValue.toString(), dictItems);
                BeanUtil.setFieldValue(convertObject,dictConvert.target(), dictValue);
            }
        }
    }

    /**
     * 初始化转换字段元信息
     */
    private DictConvertInfo initConvertInfo(PropertyDescriptor descriptor){
        Field field = ClassUtil.getDeclaredField(descriptor.getReadMethod().getDeclaringClass(), descriptor.getName());
        DictConvert dictConvert = AnnotationUtil.getAnnotation(field, DictConvert.class);
        DictConvertModel dictConvertModel = AnnotationUtil.getAnnotation(field, DictConvertModel.class);

        return new DictConvertInfo()
                .setName(descriptor.getName())
                .setField(field)
                .setDictConvert(dictConvert)
                .setDictConvertModel(dictConvertModel);
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
     * 转换成map
     */
    public Map<String,Object> convertToMap(Object o){

        return new HashMap<>();
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
        private DictConvert dictConvert;
        // 嵌套翻译注解
        private DictConvertModel dictConvertModel;
    }
}

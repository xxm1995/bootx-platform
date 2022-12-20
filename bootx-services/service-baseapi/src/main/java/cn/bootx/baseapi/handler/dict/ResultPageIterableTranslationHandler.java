package cn.bootx.baseapi.handler.dict;

import cn.bootx.baseapi.core.dict.service.DictTranslationService;
import cn.bootx.common.core.annotation.DictTranslation;
import cn.bootx.common.core.rest.ResResult;
import cn.hutool.core.util.ClassUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Map;

/**
 * ResResult返回类的处理, 泛型 T 为 Iterable 的实现, 比如 List
 * @author xxm
 * @date 2022/12/20
 */
@Component
@RequiredArgsConstructor
public class ResultPageIterableTranslationHandler implements DictTranslationHandler{
    private final DictTranslationService dictTranslationService;

    /**
     * ResResult类型, 泛型 T 为 Iterable 的实现, 比如 List
     */
    @Override
    public boolean adaptation(Type type) {
        // 是否是泛型类型
        if (type instanceof ParameterizedType){
            ParameterizedType parameterizedType = (ParameterizedType) type;
            // 是否是ResResult类型, 并且是泛型(ParameterizedType)
            Type rawType = parameterizedType.getRawType();
            if (rawType instanceof ParameterizedType ){
                // 看类型是否为分页
                Type actualType = ((ParameterizedType) rawType).getActualTypeArguments()[0];
                if (actualType instanceof Class<?> && ClassUtil.isAssignable((Class<?>) actualType, Iterable.class)) {
                    return true;
                }
            }
        }
        return false;
    }

    @SuppressWarnings("unchecked")
    @Override
    public void translation(Object object, Type type, DictTranslation dictTranslation) {
        ResResult<Iterable<?>> resResult = (ResResult<Iterable<?>>) object;
        Iterable<?> iterable = resResult.getData();
        if (dictTranslation.convertType()== DictTranslation.ConvertType.OBJECT){
            dictTranslationService.translation(iterable);
        } else {
            Iterable<Map<String, Object>> maps = dictTranslationService.translationToMap(iterable);
            resResult.setData(maps);
        }
    }
}

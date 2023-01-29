package cn.bootx.common.translate.handler.impl;

import cn.bootx.common.core.annotation.TranslationResult;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.translate.handler.TranslationHandler;
import cn.bootx.common.translate.service.FieldTranslationService;
import cn.hutool.core.util.ClassUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Map;

/**
 * ResResult返回类的处理, 泛型 T 不为泛型类
 * @author xxm
 * @date 2022/12/20
 */
@Component
@RequiredArgsConstructor
public class ResultObjectTranslationHandler implements TranslationHandler {
    private final FieldTranslationService translationService;

    /**
     * ResResult类型, 原始包装的普通类型
     */
    @Override
    public boolean adaptation(Type type) {
        // 是否是泛型类型
        if (type instanceof ParameterizedType){
            ParameterizedType parameterizedType = (ParameterizedType) type;
            // 是否是ResResult类型, 并且Class类型是非泛型(ParameterizedType)
            Type rawType = parameterizedType.getRawType();
            if (rawType instanceof Class<?> && ClassUtil.isAssignable((Class<?>) rawType,ResResult.class)){
                return true;
            }
        }
        return false;
    }

    @SuppressWarnings("unchecked")
    @Override
    public void translation(Object object, Type type, TranslationResult translationResult) {
        ResResult<?> resResult = (ResResult<?>) object;
        Object data = resResult.getData();
        if (translationResult.convertType()== TranslationResult.ConvertType.OBJECT){
            translationService.translation(data);
        } else {
            Map<String, Object> stringObjectMap = translationService.translationToMap(data);
            ((ResResult<Map<String, Object>>)resResult).setData(stringObjectMap);
        }
    }
}

package cn.bootx.platform.common.translate.handler.impl;

import cn.bootx.platform.common.translate.service.FieldTranslationService;
import cn.bootx.platform.common.core.annotation.TranslationResult;
import cn.bootx.platform.common.core.rest.ResResult;
import cn.bootx.platform.common.translate.handler.TranslationHandler;
import cn.hutool.core.util.ClassUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.Map;

/**
 * ResResult返回类的处理, 泛型 T 为 Iterable 的实现, 比如 List
 *
 * @author xxm
 * @since 2022/12/20
 */
@Component
@RequiredArgsConstructor
public class ResultPageIterableTranslationHandler implements TranslationHandler {

    private final FieldTranslationService translationService;

    /**
     * ResResult类型, 泛型 T 为 Iterable 的实现, 比如 List
     */
    @Override
    public boolean adaptation(Type type) {
        // 是否是泛型类型
        if (type instanceof ParameterizedType) {
            ParameterizedType parameterizedType = (ParameterizedType) type;
            // 是否是ResResult类型, 并且是泛型(ParameterizedType)
            Type rawType = parameterizedType.getRawType();
            if (rawType instanceof ParameterizedType) {
                // 看类型是否为分页
                Type actualType = ((ParameterizedType) rawType).getActualTypeArguments()[0];
                if (actualType instanceof Class<?> && ClassUtil.isAssignable((Class<?>) actualType, Collection.class)) {
                    return true;
                }
            }
        }
        return false;
    }

    @SuppressWarnings("unchecked")
    @Override
    public void translation(Object object, Type type, TranslationResult translationResult) {
        ResResult<Collection<?>> resResult = (ResResult<Collection<?>>) object;
        Collection<?> collection = resResult.getData();
        if (translationResult.convertType() == TranslationResult.ConvertType.OBJECT) {
            translationService.translation(collection);
        }
        else {
            Collection<Map<String, Object>> maps = translationService.translationToMap(collection);
            resResult.setData(maps);
        }
    }

}

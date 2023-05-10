package cn.bootx.platform.common.translate.handler.impl;

import cn.bootx.platform.common.translate.service.FieldTranslationService;
import cn.bootx.platform.common.core.annotation.TranslationResult;
import cn.bootx.platform.common.core.rest.ResResult;
import cn.bootx.platform.common.core.util.CollUtil;
import cn.bootx.platform.common.translate.handler.TranslationHandler;
import cn.hutool.core.util.ClassUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

/**
 * ResResult返回类的处理, 泛型 T 为分页类
 *
 * @author xxm
 * @date 2022/12/20
 */
@Component
@RequiredArgsConstructor
public class ResultPageTranslationHandler implements TranslationHandler {

    private final FieldTranslationService translationService;

    /**
     * ResResult类型, T 为分页类
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
                if (actualType instanceof Class<?> && ClassUtil.isAssignable((Class<?>) actualType, IPage.class)) {
                    return true;
                }
            }
        }
        return false;
    }

    @SuppressWarnings("unchecked")
    @Override
    public void translation(Object object, Type type, TranslationResult translationResult) {
        ResResult<IPage<?>> resResult = (ResResult<IPage<?>>) object;
        IPage<?> page = resResult.getData();
        if (translationResult.convertType() == TranslationResult.ConvertType.OBJECT) {
            List<?> records = page.getRecords();
            translationService.translation(records);
        }
        else {
            List<?> records = page.getRecords();
            Iterable<Map<String, Object>> maps = translationService.translationToMap(records);
            List<Map<String, Object>> list = CollUtil.newArrayList(maps);
            ((IPage<Map<String, Object>>) page).setRecords(list);
        }
    }

}

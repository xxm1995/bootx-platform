package cn.bootx.baseapi.handler.dict;

import cn.bootx.common.core.annotation.TranslationResult;
import cn.hutool.core.util.TypeUtil;
import lombok.RequiredArgsConstructor;
import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.aop.framework.AopProxyUtils;
import org.springframework.stereotype.Component;

import javax.annotation.Nullable;
import javax.validation.constraints.NotNull;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Objects;

/**
 * 字典翻译切点
 * @author xxm
 * @date 2022/12/20
 */
@Component
@RequiredArgsConstructor
public class DictInterceptor implements MethodInterceptor {

    private final List<DictTranslationHandler> dictTranslationHandlers;

    @Nullable
    @Override
    public Object invoke(@NotNull MethodInvocation invocation) throws Throwable {
        if (Objects.isNull(invocation)){
            return null;
        }
        // 使用其他aop组件时,aop切了两次.
        Class<?> cls = AopProxyUtils.ultimateTargetClass(invocation.getThis());
        if (!cls.equals(invocation.getThis().getClass())) {
            return invocation.proceed();
        }
        TranslationResult translationResult = invocation.getMethod().getAnnotation(TranslationResult.class);
        Object proceed = invocation.proceed();
        // 返回值为空和未开启字典翻译直接结束
        if (Objects.isNull(proceed)||!translationResult.enable()){
            return null;
        }
        // 获取返回类型, 基础类型Type为class, 泛型类型为 ParameterizedType
        Type returnType = TypeUtil.getReturnType(invocation.getMethod());
        for (DictTranslationHandler dictTranslationHandler : dictTranslationHandlers) {
            if (dictTranslationHandler.adaptation(returnType)){
                dictTranslationHandler.translation(proceed,returnType, translationResult);
            }
        }
        return proceed;
    }


}

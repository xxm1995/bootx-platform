package cn.bootx.platform.common.translate.aop;

import cn.bootx.platform.common.core.annotation.TranslationResult;
import lombok.RequiredArgsConstructor;
import org.aopalliance.aop.Advice;
import org.springframework.aop.Pointcut;
import org.springframework.aop.support.AbstractPointcutAdvisor;
import org.springframework.aop.support.annotation.AnnotationMatchingPointcut;
import org.springframework.stereotype.Component;

/**
 * 字段翻译切入点配置
 *
 * @author xxm
 * @since 2022/12/20
 */
@Component
@RequiredArgsConstructor
public class TranslationAnnotationAdvisor extends AbstractPointcutAdvisor {

    private final TranslationInterceptor translationInterceptor;

    private final Pointcut pointcut = AnnotationMatchingPointcut.forMethodAnnotation(TranslationResult.class);

    /**
     * 切入点
     */
    @Override
    public Pointcut getPointcut() {
        return pointcut;
    }

    /**
     * 切点处理适配器
     */
    @Override
    public Advice getAdvice() {
        return translationInterceptor;
    }

}

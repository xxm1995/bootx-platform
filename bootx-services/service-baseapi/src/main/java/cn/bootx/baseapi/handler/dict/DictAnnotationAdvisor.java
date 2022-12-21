package cn.bootx.baseapi.handler.dict;

import cn.bootx.common.core.annotation.DictTranslation;
import lombok.RequiredArgsConstructor;
import org.aopalliance.aop.Advice;
import org.springframework.aop.Pointcut;
import org.springframework.aop.support.AbstractPointcutAdvisor;
import org.springframework.aop.support.annotation.AnnotationMatchingPointcut;
import org.springframework.stereotype.Component;

/**
 * 字段翻译切入点配置
 * @author xxm
 * @date 2022/12/20
 */
@Component
@RequiredArgsConstructor
public class DictAnnotationAdvisor extends AbstractPointcutAdvisor {

    private final DictInterceptor dictInterceptor;

    private final Pointcut pointcut = AnnotationMatchingPointcut.forMethodAnnotation(DictTranslation.class);

    /**
     * 切入点
     * @return
     */
    @Override
    public Pointcut getPointcut() {
        return pointcut;
    }

    /**
     * 切点处理适配器
     * @return
     */
    @Override
    public Advice getAdvice() {
        return dictInterceptor;
    }

}

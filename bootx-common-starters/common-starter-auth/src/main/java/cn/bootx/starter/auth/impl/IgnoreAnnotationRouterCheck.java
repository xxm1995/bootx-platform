package cn.bootx.starter.auth.impl;

import cn.bootx.common.core.annotation.IgnoreAuth;
import cn.bootx.starter.auth.authentication.RouterCheck;
import cn.bootx.starter.auth.util.SecurityUtil;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;

import java.util.Objects;

/**
 * 注解方式过滤
 * @author xxm
 * @date 2021/12/21
 */
@Component
public class IgnoreAnnotationRouterCheck implements RouterCheck {

    @Override
    public int sortNo() {
        return -99;
    }

    @Override
    public boolean check(Object handler) {
        if (handler instanceof HandlerMethod){
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            // controller上是否加了跳过鉴权注解
            IgnoreAuth ignoreAuth = handlerMethod.getBeanType().getAnnotation(IgnoreAuth.class);
            if (Objects.isNull(ignoreAuth)) {
                // 方法上上是否加了跳过鉴权注解
                ignoreAuth = handlerMethod.getMethodAnnotation(IgnoreAuth.class);
            } else {
                // controller和方法上都加了跳过鉴权注解,以方法上为准
                IgnoreAuth annotation = handlerMethod.getMethodAnnotation(IgnoreAuth.class);
                if (Objects.nonNull(annotation)){
                    ignoreAuth = annotation;
                }
            }
            return this.ignoreAuth(ignoreAuth);
        }
        return false;
    }

    /**
     * 忽略鉴权注解处理
     */
    private boolean ignoreAuth(IgnoreAuth ignoreAuth){
        if (Objects.isNull(ignoreAuth)){
            return false;
        }
        // 忽略鉴权
        if (ignoreAuth.ignore()){
            return true;
        }
        // 只校验登录状态
        if (ignoreAuth.login()){
            return SecurityUtil.getCurrentUser().isPresent();
        }
        return false;
    }
}

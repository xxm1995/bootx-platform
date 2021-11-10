package cn.bootx.starter.auth.handler;

import cn.bootx.common.core.annotation.IgnoreAuth;
import cn.dev33.satoken.fun.SaFunction;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.stp.StpUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.web.method.HandlerMethod;

import java.util.Objects;

/**
 * 鉴权路由配置类
 * @author xxm
 * @date 2021/8/2
 */
@RequiredArgsConstructor
public class IgnoreSaRouteFunction implements SaFunction {
    private final Object handler;

    @Override
    public void run() {
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
                if (Objects.nonNull(annotation) ){
                    if (ignoreAuth.ignore()) {
                        SaRouter.stop();
                    } else {
                        StpUtil.checkLogin();
                    }
                }
            }
            if (Objects.nonNull(ignoreAuth) && ignoreAuth.ignore()){
                SaRouter.stop();
            }
        }
        StpUtil.checkLogin();
    }
}
package cn.bootx.starter.auth.config;

import cn.bootx.starter.auth.handler.IgnoreSaRouteFunction;
import cn.dev33.satoken.interceptor.SaRouteInterceptor;
import cn.dev33.satoken.router.SaRouter;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.Collections;

/**
 * sa-token
 * @author xxm
 * @date 2021/7/30
 */
@EnableConfigurationProperties(AuthProperties.class)
@Configuration
@RequiredArgsConstructor
public class SaTokenConfigure implements WebMvcConfigurer {

    private final AuthProperties permitAllUrlProperties;

    /**
     * 注册拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 注册路由拦截器，自定义验证规则
        registry.addInterceptor(new SaRouteInterceptor((req, res, handler)->
                SaRouter.match(Collections.singletonList("/**"),
                        permitAllUrlProperties.getIgnoreUrls(),
                        new IgnoreSaRouteFunction(handler))
        )).addPathPatterns("/**");
    }

}

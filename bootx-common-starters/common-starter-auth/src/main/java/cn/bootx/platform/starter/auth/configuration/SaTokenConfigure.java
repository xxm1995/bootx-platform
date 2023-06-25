package cn.bootx.platform.starter.auth.configuration;

import cn.bootx.platform.starter.auth.handler.SaRouteHandler;
import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.router.SaRouter;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.Collections;

/**
 * sa-token
 *
 * @author xxm
 * @since 2021/7/30
 */
@EnableConfigurationProperties(AuthProperties.class)
@RequiredArgsConstructor
@Configuration
public class SaTokenConfigure implements WebMvcConfigurer {

    private final AuthProperties permitAllUrlProperties;

    private final SaRouteHandler saRouteHandler;

    /**
     * 注册拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        SaInterceptor saInterceptor = new SaInterceptor(handler ->
                SaRouter.match(Collections.singletonList("/**"))
                .notMatch(permitAllUrlProperties.getIgnoreUrls())
                // 注册自定义鉴权路由配置
                .check(saRouteHandler.check(handler))
        );
        // 注册路由拦截器，自定义验证规则
        registry
            .addInterceptor(saInterceptor)
            .addPathPatterns("/**");
    }

}

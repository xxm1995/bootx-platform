package cn.bootx.starter.auth.handler;

import cn.bootx.starter.auth.authentication.RouterCheck;
import cn.bootx.starter.auth.exception.RouterCheckException;
import cn.dev33.satoken.fun.SaFunction;
import cn.dev33.satoken.router.SaRouter;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

import java.util.Comparator;
import java.util.List;

/**
 * 鉴权路由配置类
 * @author xxm
 * @date 2021/8/2
 */
@Component
@RequiredArgsConstructor
public class SaRouteHandler implements InitializingBean {
    private final List<RouterCheck> routerChecks;

    @Override
    public void afterPropertiesSet() {
        // 排序
        routerChecks.sort(Comparator.comparing(RouterCheck::sortNo));
    }

    /**
     * 路由检查处理方法
     */
    public SaFunction check(Object handler){
        return ()->{
            boolean check = routerChecks.stream()
                    .anyMatch(routerCheck -> routerCheck.check(handler));
            if (check) {
                SaRouter.stop();
            } else {
                throw new RouterCheckException();
            }
        };
    }

}
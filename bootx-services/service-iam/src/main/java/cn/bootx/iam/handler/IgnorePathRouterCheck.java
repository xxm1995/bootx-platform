package cn.bootx.iam.handler;

import cn.bootx.common.spring.util.WebServletUtil;
import cn.bootx.iam.core.permission.service.PermPathService;
import cn.bootx.starter.auth.authentication.RouterCheck;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;

import java.util.List;

/**
 * 跳过不启用权限控制的路径
 * @author xxm
 * @date 2022/5/27
 */
@Component
@RequiredArgsConstructor
public class IgnorePathRouterCheck implements RouterCheck {
    private final PermPathService pathService;
    private final AntPathMatcher matcher = new AntPathMatcher();

    @Override
    public int sortNo() {
        return 2;
    }

    @Override
    public boolean check(Object handler) {
        String method = WebServletUtil.getMethod();
        String path = WebServletUtil.getPath();
        // 获取不启用权限控制的路径
        List<String> ignorePaths = pathService.findIgnorePathByRequestType(method);

        return ignorePaths.stream()
                .anyMatch(pattern->matcher.match(pattern, path));
    }
}

package cn.bootx.iam.handler;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.spring.util.WebServletUtil;
import cn.bootx.iam.core.upms.service.RolePathService;
import cn.bootx.starter.auth.authentication.RouterCheck;
import cn.bootx.starter.auth.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;

import java.util.List;
import java.util.Optional;

/**
 * 路径路由拦截
 * @author xxm
 * @date 2021/12/21
 */
@Component
@RequiredArgsConstructor
public class PathRouterCheck implements RouterCheck {
    private final RolePathService rolePathService;
    private final AntPathMatcher matcher = new AntPathMatcher();
    @Override
    public int sortNo() {
        return 1;
    }

    @Override
    public boolean check(Object handler) {
        String method = WebServletUtil.getMethod();
        String path = WebServletUtil.getPath();

        Optional<UserDetail> UserDetailOpt = SecurityUtil.getCurrentUser();
        if (!UserDetailOpt.isPresent()){
            return false;
        }
        UserDetail userDetail = UserDetailOpt.get();
        // 管理员有所有的权限
        if (userDetail.isAdmin()){
            return true;
        }
        List<String> paths = rolePathService.findSimplePathsByUser(method,userDetail.getId());
        return paths.stream()
                .anyMatch(pattern->matcher.match(pattern, path));
    }
}

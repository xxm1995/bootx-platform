package cn.bootx.starter.flowable.web;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.bootx.starter.flowable.local.BpmContextLocal;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import org.flowable.common.engine.impl.identity.Authentication;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * flowable Web 过滤器，将 userId 设置到工作流里
 *
 * @author xxm
 * @date 2022/8/24
 */
@Component
@RequiredArgsConstructor
@ConditionalOnWebApplication(type = ConditionalOnWebApplication.Type.SERVLET)
public class FlowableWebFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException {
        try {
            // 设置工作流的用户
            String userId = SecurityUtil.getCurrentUser().map(UserDetail::getId).map(String::valueOf).orElse(null);
            if (StrUtil.isNotBlank(userId)) {
                Authentication.setAuthenticatedUserId(String.valueOf(userId));
            }
            // 过滤
            chain.doFilter(request, response);
        }
        finally {
            BpmContextLocal.clear();
            // 清理
            Authentication.setAuthenticatedUserId(null);

        }
    }

}

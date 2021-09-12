package cn.bootx.common.log;

import cn.bootx.common.core.code.CommonCode;
import cn.hutool.core.util.RandomUtil;
import lombok.RequiredArgsConstructor;
import org.slf4j.MDC;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;

/**   
* 针对请求生成链路追踪ID
* @author xxm  
* @date 2021/4/20 
*/
@RequiredArgsConstructor
@ConditionalOnWebApplication(type = ConditionalOnWebApplication.Type.SERVLET)
public class LogTraceHeaderHolderInterceptor extends GenericFilterBean {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        try {
            MDC.put(CommonCode.TRACE_ID, RandomUtil.randomString(12));
            chain.doFilter(request,response);
        } finally {
            MDC.clear();
        }
    }
}

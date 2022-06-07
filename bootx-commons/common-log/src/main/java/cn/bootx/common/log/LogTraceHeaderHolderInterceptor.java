package cn.bootx.common.log;

import cn.bootx.common.core.code.CommonCode;
import cn.hutool.core.util.RandomUtil;
import com.plumelog.core.TraceId;
import lombok.RequiredArgsConstructor;
import org.slf4j.MDC;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.stereotype.Component;
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
@Component
@RequiredArgsConstructor
@ConditionalOnWebApplication(type = ConditionalOnWebApplication.Type.SERVLET)
public class LogTraceHeaderHolderInterceptor extends GenericFilterBean {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        try {
            String traceId = RandomUtil.randomString(12);
            // 添加普通日志和 plumelog 日志的 TraceId
            TraceId.logTraceID.set(traceId);
            MDC.put(CommonCode.TRACE_ID, traceId);
            chain.doFilter(request,response);
        } finally {
            MDC.clear();
        }
    }
}

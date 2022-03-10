package cn.bootx.common.headerholder.filter;

import cn.bootx.common.core.code.ServletCode;
import cn.bootx.common.headerholder.local.HolderContextHolder;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Enumeration;

/**   
* 请求头保存
* @author xxm  
* @date 2021/4/20 
*/
@RequiredArgsConstructor
@ConditionalOnWebApplication(type = ConditionalOnWebApplication.Type.SERVLET)
public class WebHeaderHolderInterceptor extends GenericFilterBean {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        try {
            if (request instanceof HttpServletRequest){
                HttpServletRequest req = (HttpServletRequest) request;
                // 保存一些Servlet请求的数据
                HolderContextHolder.put(ServletCode.METHOD,req.getMethod());
                HolderContextHolder.put(ServletCode.CONTEXT_PATH,req.getContextPath());
                HolderContextHolder.put(ServletCode.REQUEST_URI,req.getRequestURI());
                HolderContextHolder.put(ServletCode.REQUEST_URL,req.getRequestURL().toString());
                // 保存请求头数据
                Enumeration<String> headerNames = req.getHeaderNames();
                while (headerNames.hasMoreElements()){
                    String header = headerNames.nextElement();
                    HolderContextHolder.put(header,req.getHeader(header));
                }
            }
            chain.doFilter(request, response);
        } finally {
            HolderContextHolder.clear();
        }
    }
}

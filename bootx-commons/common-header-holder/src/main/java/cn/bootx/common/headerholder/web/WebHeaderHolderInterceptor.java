package cn.bootx.common.headerholder.web;

import cn.bootx.common.headerholder.local.HolderContextHolder;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;
import java.util.Map;

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
            // 保存请求头数据
            Map<String, String[]> parameterMap = request.getParameterMap();
            parameterMap.keySet().forEach(header -> HolderContextHolder.put(header,request.getParameter(header)));
            chain.doFilter(request, response);
        } finally {
            HolderContextHolder.clear();
        }
    }
}

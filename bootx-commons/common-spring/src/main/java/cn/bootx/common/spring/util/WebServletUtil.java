package cn.bootx.common.spring.util;

import lombok.experimental.UtilityClass;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**   
* web服务器工具类
* @author xxm  
* @date 2021/8/13 
*/
@UtilityClass
public class WebServletUtil {

    /**
     * 获取http请求
     */
    public HttpServletRequest getRequest(){
        return getRequestAttributes().getRequest();
    }

    /**
     * 获取请求类型
     */
    public String getMethod(){
        return getRequest().getMethod();
    }

    /**
     * 获取参数
     */
    public String getParameter(String name){
        return getRequest().getParameter(name);
    }

    /**
     * 获取http响应
     */
    public HttpServletResponse getResponse(){
        return getRequestAttributes().getResponse();
    }

    /**
     * 获取RequestAttributes
     */
    public ServletRequestAttributes getRequestAttributes(){
        RequestAttributes attributes = RequestContextHolder.getRequestAttributes();
        return (ServletRequestAttributes) attributes;
    }
}

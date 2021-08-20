package cn.bootx.common.headerholder;

import cn.bootx.common.core.code.WebHeaderConst;
import cn.bootx.common.headerholder.local.HolderContextHolder;
import lombok.experimental.UtilityClass;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

/**
 * 请求头获取工具类
 * @author xxm
 * @date 2020/4/14 15:23
 */
@UtilityClass
public class HeaderHolder {

    public String getOpToken() {
        return getHeader(WebHeaderConst.OP_TOKEN);
    }

    /**
     * 获取请求头参数
     */
    public String getHeader(String name){

        // TTL
        String ttlHeader = HolderContextHolder.get(name);
        if (Objects.nonNull(ttlHeader)){
            return ttlHeader;
        }

        // web
        String webHeader = getWebHeader(name);
        if (Objects.nonNull(webHeader)){
            return webHeader;
        }
        return null;
    }

    private String getWebHeader(String name) {
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        if (requestAttributes == null) {
            return null;
        }
        HttpServletRequest request = ((ServletRequestAttributes) requestAttributes).getRequest();
        return request.getHeader(name);
    }
}


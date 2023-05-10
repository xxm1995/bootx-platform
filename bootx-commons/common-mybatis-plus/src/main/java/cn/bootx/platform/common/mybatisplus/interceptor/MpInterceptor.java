package cn.bootx.platform.common.mybatisplus.interceptor;

import com.baomidou.mybatisplus.extension.plugins.inner.InnerInterceptor;
import lombok.*;

/**
 * mp插件包装(支持排序)
 *
 * @author xxm
 * @date 2021/12/21
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MpInterceptor {

    /** mp拦截器 */
    private InnerInterceptor innerInterceptor;

    /** 排序 */
    private int sortNo = 0;

    public MpInterceptor(InnerInterceptor innerInterceptor) {
        this.innerInterceptor = innerInterceptor;
    }

}

package cn.bootx.starter.data.perm.configuration;

import cn.bootx.common.mybatisplus.interceptor.MpInterceptor;
import cn.bootx.starter.data.perm.record.BootxDataPermissionHandler;
import cn.bootx.starter.data.perm.select.SelectFieldPermInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.DataPermissionInterceptor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**   
* 数据权限配置
* @author xxm  
* @date 2021/12/21 
*/
@Configuration
@RequiredArgsConstructor
public class DatePermConfiguration {

    /**
     * 数据权限插件
     */
    @Bean
    public MpInterceptor dataPermissionInterceptor(BootxDataPermissionHandler bootxDataPermissionHandler) {
        return new MpInterceptor(new DataPermissionInterceptor(bootxDataPermissionHandler));
    }
    /**
     * 查询字段权限插件
     */
    @Bean
    public MpInterceptor selectFieldPermInterceptorMp(SelectFieldPermInterceptor bootxDataPermissionHandler) {
        return new MpInterceptor(bootxDataPermissionHandler);
    }
}

package cn.bootx.common.mybatisplus.encrypt;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Signature;
import org.springframework.stereotype.Component;

/**   
* 数据字段解密插件
* @author xxm  
* @date 2021/11/23 
*/
@Intercepts(@Signature(type= BaseMapper.class,method="updateById",args={Object.class}))
@Component
public class EncryptInterceptor implements Interceptor {

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        Object[] args = invocation.getArgs();
        // TODO 保存和更新时字段属性进行加密
        return invocation.proceed();
    }
}

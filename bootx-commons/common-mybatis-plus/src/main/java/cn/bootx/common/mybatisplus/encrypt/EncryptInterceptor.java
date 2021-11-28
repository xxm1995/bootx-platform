package cn.bootx.common.mybatisplus.encrypt;

import cn.bootx.common.core.annotation.EncryptionField;
import cn.hutool.core.util.ReflectUtil;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Signature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**   
* 数据字段解密插件
* @author xxm  
* @date 2021/11/23 
*/
@Intercepts(@Signature(type= Executor.class,method="update",args={MappedStatement.class,Object.class}))
@Component
public class EncryptInterceptor implements Interceptor {

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        Object[] args = invocation.getArgs();
        // 获取第二个参数
        Object arg = args[1];
        if (arg instanceof Map){
            Map<String, ?> map = (Map<String, Object>) arg;
            Object et = map.get("et");

        }
        return invocation.proceed();
    }

    /**
     * 加密
     */
    public Object encrypt(Object result){
        if (result instanceof List){
            List<?> list = (List<?>) result;
            for (Object o : list) {
                Field[] fields = ReflectUtil.getFields(o.getClass(), field -> Objects.nonNull(field.getAnnotation(EncryptionField.class)));
                for (Field field : fields) {
                    ReflectUtil.setFieldValue(o,field,ReflectUtil.getFieldValue(o,field));
                }
            }
        } else {
            Field[] fields = ReflectUtil.getFields(result.getClass(), field -> Objects.nonNull(field.getAnnotation(EncryptionField.class)));

        }
        return result;
    }
}

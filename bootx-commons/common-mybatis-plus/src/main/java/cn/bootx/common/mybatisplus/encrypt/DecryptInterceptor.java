package cn.bootx.common.mybatisplus.encrypt;

import cn.bootx.common.core.annotation.EncryptionField;
import cn.hutool.core.util.ReflectUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.executor.resultset.ResultSetHandler;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Signature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**   
* 数据字段解密插件
* @author xxm  
* @date 2021/11/23 
*/
@Slf4j
@Intercepts(@Signature(type = ResultSetHandler.class, method = "handleResultSets", args = {Statement.class}))
@Component
public class DecryptInterceptor implements Interceptor {

    /**
     * 拦截返回的结果
     * @throws Throwable
     */
    @Override
    public Object intercept(Invocation invocation) throws Throwable {

        Object result = invocation.proceed();
        return this.decrypt(result);
    }

    /**
     * 解密
     * @param result
     * @return
     */
    private Object decrypt(Object result){
        if (result instanceof List<?>) {
            List<?> list = (ArrayList<?>) result;
            for (Object o : list) {
                Field[] fields = ReflectUtil.getFields(o.getClass(), field -> Objects.nonNull(field.getAnnotation(EncryptionField.class)));
                for (Field field : fields) {
                    ReflectUtil.setFieldValue(o,field,ReflectUtil.getFieldValue(o,field));
                }
            }
            return list;
        }
        return result;
    }

}

package cn.bootx.common.mybatisplus.handler;

import cn.bootx.common.jackson.util.JacksonUtil;
import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.baomidou.mybatisplus.extension.handlers.AbstractJsonTypeHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

/**   
* Jackson 实现 JSON 字段类型处理器, 会记录对象属性类型, 通常用于被容器(List、Set、Map)包装的属性上
* @author xxm  
* @date 2022/7/11 
*/
@Slf4j
@MappedTypes({Object.class})
@MappedJdbcTypes(JdbcType.VARCHAR)
public class JacksonListTypeHandler extends AbstractJsonTypeHandler<Object> {
    private final Class<?> type;

    public JacksonListTypeHandler(Class<?> type) {
        if (log.isTraceEnabled()) {
            log.trace("JacksonListTypeHandler(" + type + ")");
        }
        Assert.notNull(type, "Type argument cannot be null");
        this.type = type;
    }

    @Override
    protected Object parse(String json) {
        return JacksonUtil.toTypeBean(json,type);
    }

    @Override
    protected String toJson(Object obj) {
        return JacksonUtil.toTypeJson(obj);
    }
}

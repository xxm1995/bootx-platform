package cn.bootx.platform.common.mybatisplus.handler;

import cn.bootx.platform.common.jackson.util.JacksonUtil;
import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.baomidou.mybatisplus.extension.handlers.AbstractJsonTypeHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

/**
 * Jackson 实现 JSON 字段类型处理器, 会记录对象属性类型, 通常用于储存不确定对象的属性上
 * 例如: 泛型对象、存储的数据是字段类型的子类等
 *
 * @author xxm
 * @since 2022/7/11
 */
@Slf4j
@MappedTypes({ Object.class })
@MappedJdbcTypes(value = { JdbcType.VARCHAR, JdbcType.LONGVARCHAR })
public class JacksonRawTypeHandler extends AbstractJsonTypeHandler<Object> {

    private final Class<?> type;

    public JacksonRawTypeHandler(Class<?> type) {
        if (log.isTraceEnabled()) {
            log.trace("JacksonRawTypeHandler(" + type + ")");
        }
        Assert.notNull(type, "Type argument cannot be null");
        this.type = type;
    }

    @Override
    protected Object parse(String json) {
        return JacksonUtil.toTypeBean(json, type);
    }

    @Override
    protected String toJson(Object obj) {
        return JacksonUtil.toTypeJson(obj);
    }

}

package cn.bootx.common.mybatisplus.util;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.hutool.core.collection.ListUtil;
import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.baomidou.mybatisplus.core.toolkit.LambdaUtils;
import com.baomidou.mybatisplus.core.toolkit.support.ColumnCache;
import com.baomidou.mybatisplus.core.toolkit.support.LambdaMeta;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.reflection.property.PropertyNamer;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Consumer;
import java.util.stream.Collectors;

/**
 * 工具类
 * @author xxm
 * @date 2020/4/21 10:00
 */
public class MpUtil {
	/**
	 * mp page转换为 PageResult 同时进行dto转换
	 */
	public static <T> PageResult<T> convert2DtoPageResult(Page<? extends EntityBaseFunction<T>> page){
		if (Objects.isNull(page)){
			return new PageResult<>();
		}
		List<T> collect = page.getRecords()
				.stream()
				.map(EntityBaseFunction::toDto)
				.collect(Collectors.toList());
		// 构造 PageResult 对象
		return new PageResult<T>()
				.setSize(page.getSize())
				.setCurrent(page.getCurrent())
				.setTotal(page.getTotal())
				.setRecords(collect);
	}

    /**
     * page转换为 PageResult
     */
    public static <T> PageResult<T> convert2PageResult(Page<T> page){
        if (Objects.isNull(page)){
            return new PageResult<>();
        }
        // 构造 PageResult 对象
        return new PageResult<T>()
                .setSize(page.getSize())
                .setCurrent(page.getCurrent())
                .setTotal(page.getTotal())
                .setRecords(page.getRecords());
    }

    /**
     * 获取分页对象 MyBatis-Plus
     */
    public static <T> Page<T> getMpPage(PageParam page, Class<T> clazz){
        return Page.of(page.getCurrent(),page.getSize());
    }

    /**
     * 获取行名称
     * @param function Lambda表达式
     * @return 字段名
     */
    public static <T> String getColumnName(SFunction<T,?> function){
        LambdaMeta meta = LambdaUtils.extract(function);
        Map<String, ColumnCache> columnMap = LambdaUtils.getColumnMap(meta.getInstantiatedClass());
        Assert.notEmpty(columnMap, "错误:无法执行.因为无法获取到实体类的表对应缓存!");
        String fieldName = PropertyNamer.methodToProperty(meta.getImplMethodName());
        ColumnCache columnCache = columnMap.get(LambdaUtils.formatKey(fieldName));
        return columnCache.getColumn();
    }

    /**
     * 批量执行语句, 通常用于for循环方式的批量插入
     */
    public static <T> void executeBatch(List<T> saveList, Consumer<List<T>> consumer,int batchSize){
        // 开始游标
        int start = 0;
        // 结束游标
        int end = Math.min(batchSize, saveList.size());
        while (start < end){
            List<T> list = ListUtil.sub(saveList, start, end);
            start = end;
            end = Math.min(end + batchSize, saveList.size());
            consumer.accept(list);
        }

    }
}

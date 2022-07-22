package cn.bootx.common.mybatisplus.util;

import cn.bootx.common.core.annotation.BigField;
import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.metadata.TableFieldInfo;
import com.baomidou.mybatisplus.core.toolkit.Assert;
import com.baomidou.mybatisplus.core.toolkit.LambdaUtils;
import com.baomidou.mybatisplus.core.toolkit.support.ColumnCache;
import com.baomidou.mybatisplus.core.toolkit.support.LambdaMeta;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.reflection.property.PropertyNamer;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.function.Consumer;
import java.util.stream.Collectors;

/**
 * MP工具类
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

    /**
     * 初始化数据库Entity
     * @param entityList 对象列表
     * @param userId 用户id
     * @param <T> 泛型 MpIdEntity
     */
    public static <T extends MpIdEntity> void initEntityList(List<? extends MpIdEntity> entityList,Long userId){
        for (MpIdEntity t : entityList) {
            // 设置id
            t.setId(IdUtil.getSnowflakeNextId());
            if (t instanceof MpBaseEntity){
                MpBaseEntity entity = (MpBaseEntity) t;
                entity.setCreator(userId);
                entity.setCreateTime(LocalDateTime.now());
                entity.setLastModifier(userId);
                entity.setLastModifiedTime(LocalDateTime.now());
                entity.setVersion(0);
            }
        }
    }

    /**
     * 字段存在长文本注解则在查询时被排除
     */
    public static boolean excludeBigField(TableFieldInfo tableFieldInfo) {
        BigField annotation = tableFieldInfo.getField().getAnnotation(BigField.class);
        return Objects.isNull(annotation);
    }

    /**
     * 获取最新的一条
     */
    public static  <T> Optional<T> findOne(LambdaQueryChainWrapper<T> lambdaQuery){
        Page<T> mpPage = new Page<>(0,1);
        Page<T> page = lambdaQuery.page(mpPage);
        if (page.getTotal() > 0) {
            return Optional.of(page.getRecords().get(0));
        }
        return Optional.empty();
    }
}

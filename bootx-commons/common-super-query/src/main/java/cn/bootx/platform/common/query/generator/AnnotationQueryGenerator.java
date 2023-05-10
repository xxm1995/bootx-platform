package cn.bootx.platform.common.query.generator;

import cn.bootx.platform.common.core.annotation.QueryParam;
import cn.bootx.platform.common.core.function.CollectorsFunction;
import cn.bootx.platform.common.mybatisplus.util.MpUtil;
import cn.hutool.core.annotation.AnnotationUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.text.NamingCase;
import cn.hutool.core.util.ClassUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.experimental.UtilityClass;
import lombok.val;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 注解参数查询生成器
 *
 * @author xxm
 * @date 2022/12/14
 */
@UtilityClass
public class AnnotationQueryGenerator {

    /**
     * 生成查询条件 (根据实体对象生成), 生成的多个查询条件之间用And连接
     * @param queryParams 参数
     * @param clazz 数据库Entity类
     * @param <T> 泛型
     * @return 查询器
     */
    <T> QueryWrapper<T> generator(Object queryParams, Class<T> clazz) {
        QueryWrapper<T> wrapper = new QueryWrapper<>();
        if (Objects.isNull(queryParams)) {
            return wrapper;
        }

        // 读取参数的字段
        List<PropertyDescriptor> paramClassProps = Arrays
            .stream(BeanUtil.getPropertyDescriptors(queryParams.getClass()))
            .collect(Collectors.toList());

        // 读取实体类对象的字段
        Map<String, PropertyDescriptor> entityClassPropMap = Arrays.stream(BeanUtil.getPropertyDescriptors(clazz))
            .collect(Collectors.toMap(PropertyDescriptor::getName, Function.identity(),
                    CollectorsFunction::retainLatest));

        // 遍历参数上的对象, 生成查询构造器条件
        for (PropertyDescriptor paramProp : paramClassProps) {
            Object paramValue = BeanUtil.getProperty(queryParams, paramProp.getName());
            if (!StrUtil.isBlankIfStr(paramValue)) {
                PropertyDescriptor clazzDescriptor = entityClassPropMap.get(paramProp.getName());
                // 获取查询注解 clazz 类上 < clazz 字段 < queryParams 类上 < clazz 字段
                val annotation = getQueryParamAnnotation(paramProp, queryParams.getClass(), clazzDescriptor, clazz);
                // 是否忽略本字段
                if (annotation.map(QueryParam::ignore).orElse(false)) {
                    continue;
                }
                // 获取对应的数据库字段名称
                QueryParam.NamingCaseEnum namingCase = annotation.map(QueryParam::namingCase).orElse(QueryParam.NamingCaseEnum.UNDER_LINE);
                String columnName = getDatabaseFieldName(paramProp, queryParams.getClass(), clazzDescriptor, clazz,
                        namingCase);
                // 处理匹配条件类型
                QueryParam.CompareTypeEnum compareType = annotation.map(QueryParam::type).orElse(QueryParam.CompareTypeEnum.EQ);
                compareTypeSwitch(compareType, wrapper, columnName, paramValue);
            }
        }
        return wrapper;

    }

    /**
     * 生成查询条件 (根据实体对象生成), 生成的多个查询条件之间用And连接
     * @param queryParams 参数
     * @param <T> 泛型
     * @return 查询器
     */
    <T> QueryWrapper<T> generator(Object queryParams) {
        QueryWrapper<T> wrapper = new QueryWrapper<>();

        if (Objects.isNull(queryParams)) {
            return wrapper;
        }

        // 读取参数的字段
        List<PropertyDescriptor> paramClassProps = Arrays
            .stream(BeanUtil.getPropertyDescriptors(queryParams.getClass()))
            .collect(Collectors.toList());

        // 遍历参数上的对象, 生成查询构造器条件
        for (PropertyDescriptor paramProp : paramClassProps) {
            Object paramValue = BeanUtil.getProperty(queryParams, paramProp.getName());
            if (!StrUtil.isBlankIfStr(paramValue)) {
                // 获取查询注解 clazz 类上 < clazz 字段 < queryParams 类上 < clazz 字段
                val annotation = getQueryParamAnnotation(paramProp, queryParams.getClass(), null, null);
                // 是否忽略本字段
                if (annotation.map(QueryParam::ignore).orElse(false)) {
                    continue;
                }
                // 获取对应的数据库字段名称
                QueryParam.NamingCaseEnum namingCase = annotation.map(QueryParam::namingCase).orElse(QueryParam.NamingCaseEnum.UNDER_LINE);
                String columnName = getDatabaseFieldName(paramProp, queryParams.getClass(), null, null, namingCase);
                // 处理匹配条件类型
                QueryParam.CompareTypeEnum compareType = annotation.map(QueryParam::type).orElse(QueryParam.CompareTypeEnum.EQ);
                compareTypeSwitch(compareType, wrapper, columnName, paramValue);
            }
        }

        return wrapper;
    }

    /**
     * 处理不同的匹配条件
     * @param compareType 匹配条件
     * @param wrapper 查询构造器
     * @param columnName 字段名称
     * @param paramValue 字段值
     */
    private <T> void compareTypeSwitch(QueryParam.CompareTypeEnum compareType, QueryWrapper<T> wrapper, String columnName,
                                       Object paramValue) {
        switch (compareType) {
            case GT:
                wrapper.gt(columnName, paramValue);
                break;
            case GE:
                wrapper.ge(columnName, paramValue);
                break;
            case LT:
                wrapper.lt(columnName, paramValue);
                break;
            case LE:
                wrapper.le(columnName, paramValue);
                break;
            case LIKE:
                wrapper.like(columnName, paramValue);
                break;
            case LIKE_LEFT:
                wrapper.likeLeft(columnName, paramValue);
                break;
            case LIKE_RIGHT:
                wrapper.likeRight(columnName, paramValue);
                break;
            case IS_NULL:
                if (paramValue instanceof Boolean) {
                    if (((Boolean) paramValue).booleanValue()) {
                        wrapper.isNull(columnName);
                    }
                    else {
                        wrapper.isNotNull(columnName);
                    }
                }
                break;
            case EQ:
            default:
                wrapper.eq(columnName, paramValue);
        }

    }

    /**
     * 获取查询参数注解 获取顺序: QueryParams 查询参数字段 > Entity 数据库实体字段 > QueryParams 查询类 > Entity
     * 数据库实体类
     * @return
     */
    private Optional<QueryParam> getQueryParamAnnotation(PropertyDescriptor paramDescriptor, Class<?> paramClass,
            PropertyDescriptor entityDescriptor, Class<?> entityClass) {

        // 参数字段
        Field paramField = ClassUtil.getDeclaredField(paramClass, paramDescriptor.getName());
        if (AnnotationUtil.hasAnnotation(paramField, QueryParam.class)) {
            return Optional.ofNullable(AnnotationUtil.getAnnotation(paramField, QueryParam.class));
        }
        if (Objects.nonNull(entityDescriptor)) {
            Field entityField = ClassUtil.getDeclaredField(entityClass, entityDescriptor.getName());
            if (AnnotationUtil.hasAnnotation(entityField, QueryParam.class)) {
                return Optional.ofNullable(AnnotationUtil.getAnnotation(entityField, QueryParam.class));
            }
        }
        if (AnnotationUtil.hasAnnotation(paramClass, QueryParam.class)) {
            return Optional.ofNullable(AnnotationUtil.getAnnotation(paramClass, QueryParam.class));
        }
        if (AnnotationUtil.hasAnnotation(entityClass, QueryParam.class)) {
            return Optional.ofNullable(AnnotationUtil.getAnnotation(entityClass, QueryParam.class));
        }
        return Optional.empty();
    }

    /**
     * 获取字段对应的数据库字段名
     */
    public String getDatabaseFieldName(PropertyDescriptor paramDescriptor, Class<?> paramClass,
            PropertyDescriptor entityDescriptor, Class<?> entityClass, QueryParam.NamingCaseEnum namingCase) {
        // 读取注解， 判断有没有自定义字段名, 有自定义字段名直接返回
        val queryParam = getQueryParamAnnotation(paramDescriptor, paramClass, entityDescriptor, entityClass);
        if (queryParam.map(QueryParam::fieldName).isPresent()) {
            return queryParam.map(QueryParam::fieldName).get();
        }
        switch (namingCase) {
            case LAMBDA: {
                return MpUtil.getColumnName(entityDescriptor.getReadMethod(), entityClass);
            }
            case UNDER_LINE: {
                return NamingCase.toUnderlineCase(paramDescriptor.getName());
            }
            case NONE: {
                return paramDescriptor.getName();
            }
        }
        return "";
    }

}

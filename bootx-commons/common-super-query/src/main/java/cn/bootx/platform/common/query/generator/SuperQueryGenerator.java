package cn.bootx.platform.common.query.generator;

import cn.bootx.platform.common.core.exception.BizException;
import cn.bootx.platform.common.query.code.CompareTypeEnum;
import cn.bootx.platform.common.query.entity.QueryBetweenParam;
import cn.bootx.platform.common.query.entity.QueryOrder;
import cn.bootx.platform.common.query.entity.QueryParam;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.experimental.UtilityClass;

import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

/**
 * @author xxm
 * @date 2022/12/14
 */
@UtilityClass
public class SuperQueryGenerator {

    /**
     * 组装查询条件
     * @param queryWrapper 查询器
     * @param queryParams 查询参数
     * @param <T> 泛型
     */
    <T> void initQueryParam(QueryWrapper<T> queryWrapper, List<QueryParam> queryParams) {
        if (CollUtil.isEmpty(queryParams)) {
            return;
        }
        for (QueryParam queryParam : queryParams) {
            // 嵌套条件
            List<QueryParam> nestedParams = queryParam.getNestedParams();

            // 是否拼接or条件
            if (queryParam.isOr() && CollUtil.isEmpty(nestedParams)) {
                queryWrapper.or();
            }

            // 有嵌套查询进行嵌套处理
            if (CollUtil.isEmpty(nestedParams)) {
                // 组装单条查询条件
                initQueryParam(queryWrapper, queryParam);
            }
            else {
                // 将当前查询条件与嵌套的查询条件组装成一个查询条件
                QueryParam q = new QueryParam().setParamName(queryParam.getParamName())
                    .setCompareType(queryParam.getCompareType())
                    .setParamType(queryParam.getParamType())
                    .setParamValue(queryParam.getParamValue())
                    .setUnderLine(queryParam.isUnderLine())
                    .setOr(queryParam.isOr());
                nestedParams.add(0, q);
                if (queryParam.isOr()) {
                    queryWrapper.or(wrapper -> initQueryParam(wrapper, nestedParams));
                }
                else {
                    queryWrapper.and(wrapper -> initQueryParam(wrapper, nestedParams));
                }
            }

        }
    }

    /**
     * 组装单条查询条件
     * @param queryWrapper 查询器
     * @param queryParam 查询参数
     * @param <T> 泛型
     */
    private <T> void initQueryParam(QueryWrapper<T> queryWrapper, QueryParam queryParam) {

        // 处理查询参数名称
        String paramName = initQueryParamName(queryParam);
        // 处理查询条件值
        Object paramValue = ParamValueTypeConvert.initQueryParamValue(queryParam);

        // 查询匹配类型
        CompareTypeEnum compareTypeEnum = Optional.ofNullable(CompareTypeEnum.getByCode(queryParam.getCompareType()))
            .orElseThrow(() -> new BizException("查询匹配类型非法"));
        switch (compareTypeEnum) {
            case GT:
                queryWrapper.gt(paramName, paramValue);
                break;
            case GE:
                queryWrapper.ge(paramName, paramValue);
                break;
            case LT:
                queryWrapper.lt(paramName, paramValue);
                break;
            case LE:
                queryWrapper.le(paramName, paramValue);
                break;
            case EQ:
                queryWrapper.eq(paramName, paramValue);
                break;
            case NE:
                queryWrapper.ne(paramName, paramValue);
                break;
            case IN:
                queryWrapper.in(paramName, (Collection<?>) paramValue);
                break;
            case NOT_IN:
                queryWrapper.notIn(paramName, (Collection<?>) paramValue);
                break;
            case BETWEEN: {
                if (Objects.isNull(paramValue)) {
                    throw new BizException("between 查询条件为空");
                }
                QueryBetweenParam value = (QueryBetweenParam) paramValue;
                queryWrapper.between(paramName, value.getStart(), value.getEnd());
                break;
            }
            case NOT_BETWEEN: {
                if (Objects.isNull(paramValue)) {
                    throw new BizException("between 查询条件为空");
                }
                QueryBetweenParam value = (QueryBetweenParam) paramValue;
                queryWrapper.notBetween(paramName, value.getStart(), value.getEnd());
                break;
            }
            case LIKE:
                queryWrapper.like(paramName, paramValue);
                break;
            case NOT_LIKE:
                queryWrapper.notLike(paramName, paramValue);
                break;
            case LIKE_LEFT:
                queryWrapper.likeLeft(paramName, paramValue);
                break;
            case LIKE_RIGHT:
                queryWrapper.likeRight(paramName, paramValue);
                break;
            case IS_NULL:
                queryWrapper.isNull(paramName);
                break;
            case NOT_NULL:
                queryWrapper.isNotNull(paramName);
                break;
            default:
                throw new BizException("查询匹配类型非法");
        }
    }

    /**
     * 组装排序条件
     * @param queryWrapper 查询器
     * @param queryOrders 排序条件
     * @param <T> 泛型
     */
    <T> void initQueryOrder(QueryWrapper<T> queryWrapper, List<QueryOrder> queryOrders) {
        if (CollUtil.isEmpty(queryOrders)) {
            return;
        }
        for (QueryOrder queryOrder : queryOrders) {
            if (queryOrder.isUnderLine()) {
                queryWrapper.orderBy(true, queryOrder.isAsc(), StrUtil.toUnderlineCase(queryOrder.getSortField()));
            }
            else {
                queryWrapper.orderBy(true, queryOrder.isAsc(), queryOrder.getSortField());
            }
        }
    }

    /**
     * 查询参数名称处理
     * @param queryParam 查询参数
     * @return 处理完的查询参数值
     */
    private String initQueryParamName(QueryParam queryParam) {
        String paramName = queryParam.getParamName();
        if (queryParam.isUnderLine()) {
            return StrUtil.toUnderlineCase(paramName);
        }
        else {
            return paramName;
        }
    }

}

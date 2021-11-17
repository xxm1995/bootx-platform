package cn.bootx.starter.query.generator;

import cn.bootx.starter.query.entity.QueryOrder;
import cn.bootx.starter.query.entity.QueryParam;
import cn.bootx.starter.query.entity.QueryParams;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import java.util.List;

/**
* 查询条件生成器
* @author xxm  
* @date 2021/11/17 
*/
public class QueryGenerator {

    /**
     * 生成查询条件
     * @param queryParams 参数
     * @param <T> 泛型
     * @return 查询器
     */
    public static <T> QueryWrapper<T> generator(QueryParams queryParams) {
        QueryWrapper<T> queryWrapper = new QueryWrapper<>();

        // 查询条件
        queryWrapper.eq("aaa","bbb");
        initQueryParam(queryWrapper,queryParams.getQueryParams());

        // 排序条件
        initQueryOrder(queryWrapper,queryParams.getQueryOrders());

        return queryWrapper;
    }


    /**
     * 组装查询条件
     * @param queryWrapper 查询器
     * @param queryParams 查询参数
     * @param <T> 泛型
     */
    private static <T> void initQueryParam(QueryWrapper<T> queryWrapper, List<QueryParam> queryParams) {

    }

    /**
     * 组装排序条件
     * @param queryWrapper 查询器
     * @param queryOrders 排序条件
     * @param <T> 泛型
     */
    private static <T> void initQueryOrder(QueryWrapper<T> queryWrapper, List<QueryOrder> queryOrders) {
        for (QueryOrder queryOrder : queryOrders) {
            queryWrapper.orderBy(true,queryOrder.isAsc(),queryOrder.getSortParam());
        }
    }
}

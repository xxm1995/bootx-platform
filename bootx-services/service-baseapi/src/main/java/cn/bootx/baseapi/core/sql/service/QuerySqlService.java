package cn.bootx.baseapi.core.sql.service;

import cn.bootx.baseapi.code.QuerySqlCode;
import cn.bootx.baseapi.core.dynamicsource.dao.DynamicDataSourceManager;
import cn.bootx.baseapi.core.dynamicsource.entity.DynamicDataSource;
import cn.bootx.baseapi.core.dynamicsource.service.DynamicDataSourceService;
import cn.bootx.baseapi.core.sql.dao.QuerySqlManager;
import cn.bootx.baseapi.core.sql.entity.QuerySql;
import cn.bootx.baseapi.param.sql.QueryFieldParam;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.function.CollectorsFunction;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.handler.EntityHandler;
import cn.hutool.db.handler.EntityListHandler;
import cn.hutool.db.sql.SqlExecutor;
import com.baomidou.dynamic.datasource.DynamicRoutingDataSource;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.parsing.GenericTokenParser;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.Connection;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 *
 * @author xxm
 * @date 2023/3/9
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class QuerySqlService {
    private final DynamicRoutingDataSource dynamicRoutingDataSource;

    private final DynamicDataSourceManager dynamicDataSourceManager;
    private final QuerySqlManager querySqlManager;
    private final DynamicDataSourceService dynamicDataSourceService;

    /**
     * SQL查询
     */
    @SneakyThrows
    public void querySql(){
        Map<String,String> map = new HashMap<>();
        map.put("code","hello");
        // 获取SQL语句, 将 #{} 和 ${} 元素进行解析和替换
        String sql = "select * from iam_client where code = ${code}";
        QuerySql querySql = new QuerySql()
                .setSql(sql);
        SqlAndParam sqlAndParam = this.sqlParamParser(querySql, map);

        // 将参数添加到语句中
        DataSource dataSource = this.getDataSource(1633376006887067648L);
        Connection connection = dataSource.getConnection();
        List<Entity> query =  SqlExecutor.query(connection, sql, new EntityListHandler());

    }

    /**
     * 解析SQL
     */
    private SqlAndParam sqlParamParser(QuerySql querySql, Map<String,String> map){
        String sql = querySql.getSql();
        Map<String, QuerySql.SqlParam> sqlParamMap = Optional.ofNullable(querySql.getParams()).orElse(new ArrayList<>(0)).stream()
                .collect(Collectors.toMap(QuerySql.SqlParam::getName, Function.identity(), CollectorsFunction::retainLatest));
        // # 参数处理
        GenericTokenParser replaceTokenParser = new GenericTokenParser("#{","}",content -> {
            // 获取类型, 看是否是获取用户信息一类的
            QuerySql.SqlParam sqlParam = sqlParamMap.get(content);
            if (Objects.equals(sqlParam.getType(), QuerySqlCode.TYPE_USER_ID)){
                return String.valueOf(SecurityUtil.getUserId());
            }
            return map.get(content);
        });
        sql = replaceTokenParser.parse(sql);

        // $占位参数处理
        List<String> list = new ArrayList<>();
        GenericTokenParser preparedTokenParser = new GenericTokenParser("#{","}",content -> {
            String param = map.get(content);
            list.add(param);
            return "?";
        });
        sql = preparedTokenParser.parse(sql);
        return new SqlAndParam(sql,list);
    }


    /**
     * 通过SQL查出结果字段
     */
    @SneakyThrows
    public List<String> queryFieldBySql(QueryFieldParam param){
        String sql = "select * from iam_client";
        DataSource dataSource = this.getDataSource(param.getDatabaseId());
        Connection connection = dataSource.getConnection();
        Entity query = SqlExecutor.query(connection, sql, new EntityHandler());
        System.out.println(query);
        return new ArrayList<>(query.keySet());
    }


    /**
     * 获取数据源
     */
    private DataSource getDataSource(Long id){
        DynamicDataSource dataSource = dynamicDataSourceManager.findById(id).orElseThrow(DataNotExistException::new);
        DataSource source = dynamicRoutingDataSource.getDataSource(dataSource.getCode());
        if (Objects.isNull(source)){
            dynamicDataSourceService.addDynamicDataSource(dataSource);
            source = dynamicRoutingDataSource.getDataSource(dataSource.getCode());
        }
        return source;
    }

    /**
     * 解析后的SQl语句和参数
     */
    @Getter
    @AllArgsConstructor
    private static class SqlAndParam{
        /** 解析后的SQL语句 */
        private final String sql;
        /** 解析后的参数 */
        private List<String> param;
    }
}

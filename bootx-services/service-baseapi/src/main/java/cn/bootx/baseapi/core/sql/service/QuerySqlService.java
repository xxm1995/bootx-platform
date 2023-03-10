package cn.bootx.baseapi.core.sql.service;

import cn.bootx.baseapi.core.dynamicsource.dao.DynamicDataSourceManager;
import cn.bootx.baseapi.core.dynamicsource.entity.DynamicDataSource;
import cn.bootx.baseapi.core.dynamicsource.service.DynamicDataSourceService;
import cn.bootx.baseapi.core.sql.dao.QuerySqlManager;
import cn.bootx.baseapi.param.sql.QueryFieldParam;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.hutool.db.Entity;
import cn.hutool.db.handler.EntityHandler;
import cn.hutool.db.sql.SqlExecutor;
import com.baomidou.dynamic.datasource.DynamicRoutingDataSource;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.parsing.GenericTokenParser;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.Connection;
import java.util.*;

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
    public void querySql(){
        Map<String,String> map = new HashMap<>();
        map.put("code","hello");
        // 获取SQL语句, 将 #{} 和 ${} 元素进行解析和替换
        String sql = "select * from iam_client where code = ${code}";
        GenericTokenParser tokenParser = new GenericTokenParser("${","}",content -> {
            return "?";
        });
        String parse = tokenParser.parse(sql);
        System.out.println(parse);

        // 将参数添加到语句中
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
}

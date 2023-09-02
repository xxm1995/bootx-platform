package cn.bootx.platform.baseapi.core.dataresult.service;

import cn.bootx.platform.baseapi.core.dataresult.dao.SqlQueryMapper;
import cn.bootx.platform.baseapi.dto.dataresult.SqlQueryResult;
import cn.bootx.platform.common.core.util.CollUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * SQL查询
 * @author xxm
 * @since 2023/8/29
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class SqlQueryService {

    private final SqlQueryMapper SqlQueryMapper;

    /**
     * 查询
     * @param sql
     * @return
     */
    public SqlQueryResult query(String sql){
        Page<?> page = new Page<>();
        page.setSearchCount(false)
                .setSize(500);
        List<Map<String, Object>> records = SqlQueryMapper.query(page, sql)
                .getRecords();
        SqlQueryResult sqlQueryResult = new SqlQueryResult();
        if (CollUtil.isNotEmpty(records)){
            Map<String, Object> objectMap = records.get(0);
            sqlQueryResult.setData(records)
                    .setFields(new ArrayList<>(objectMap.keySet()));
        }
        return sqlQueryResult;
    }
}

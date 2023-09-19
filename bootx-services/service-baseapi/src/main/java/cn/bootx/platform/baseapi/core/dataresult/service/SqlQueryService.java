package cn.bootx.platform.baseapi.core.dataresult.service;

import cn.bootx.platform.baseapi.core.dataresult.dao.SqlQueryMapper;
import cn.bootx.platform.baseapi.dto.dataresult.SqlQueryResult;
import cn.bootx.platform.baseapi.param.dataresult.SqlQueryParam;
import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.common.core.util.CollUtil;
import cn.bootx.platform.common.mybatisplus.util.MpUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.dynamic.datasource.toolkit.DynamicDataSourceContextHolder;
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
     * SQL查询语句
     */
    public SqlQueryResult query(SqlQueryParam param, PageParam pageParam){
        try {
            Page<?> page = MpUtil.getMpPage(pageParam, Object.class);
            page.setSearchCount(false);
            if (StrUtil.isNotBlank(param.getDatabaseKey())){
                DynamicDataSourceContextHolder.push(param.getDatabaseKey());
            }
            List<Map<String, Object>> records;
            if (param.isEnablePage()){
                records = SqlQueryMapper.queryByPage(page, param.getSql()).getRecords();
            } else {
                records = SqlQueryMapper.query(param.getSql());
            }
            SqlQueryResult sqlQueryResult = new SqlQueryResult();
            // 构造出表头
            if (CollUtil.isNotEmpty(records)){
                Map<String, Object> objectMap = records.get(0);
                sqlQueryResult.setData(records)
                        .setFields(new ArrayList<>(objectMap.keySet()));
            }
            return sqlQueryResult;
        } finally {
            if (StrUtil.isNotBlank(param.getDatabaseKey())) {
                DynamicDataSourceContextHolder.poll();
            }
        }
    }
}

package cn.bootx.starter.code.gen.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.starter.code.gen.dao.DatabaseTableMapper;
import cn.bootx.starter.code.gen.entity.DatabaseColumn;
import cn.bootx.starter.code.gen.entity.DatabaseTable;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* 数据库信息服务类型
* @author xxm
* @date 2022/1/27
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class DatabaseTableService {
    private final DatabaseTableMapper databaseTableMapper;

    /**
     * 查询全部
     */
    public List<DatabaseTable> findAll(){
        return databaseTableMapper.findAll();
    }

    /**
     * 分页
     */
    public Page<DatabaseTable> page(PageParam pageParam){
        val mpPage = MpUtil.getMpPage(pageParam, DatabaseTable.class);
        return databaseTableMapper.page(mpPage);
    }

    /**
     * 获取表信息
     */
    public DatabaseTable findByTableName(String tableName){
        return databaseTableMapper.findByTableName(tableName).orElseThrow(DataNotExistException::new);
    }
    /**
     * 获取数据表列信息
     */
    public List<DatabaseColumn> findColumnByTableName(String tableName){
        return databaseTableMapper.findColumnByTableName(tableName);
    }


}

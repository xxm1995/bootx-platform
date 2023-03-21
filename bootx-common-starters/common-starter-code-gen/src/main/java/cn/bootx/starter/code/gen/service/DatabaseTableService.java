package cn.bootx.starter.code.gen.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.starter.code.gen.dao.DatabaseTableMapper;
import cn.bootx.starter.code.gen.dto.TableGenParamDto;
import cn.bootx.starter.code.gen.entity.DatabaseColumn;
import cn.bootx.starter.code.gen.entity.DatabaseTable;
import cn.bootx.starter.code.gen.util.CodeGenUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 数据库信息服务类型
 *
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
    public List<DatabaseTable> findAll() {
        QueryWrapper<DatabaseTable> wrapper = new QueryWrapper<>();
        return databaseTableMapper.findAll(wrapper);
    }

    /**
     * 分页
     */
    public Page<DatabaseTable> page(PageParam pageParam, DatabaseTable param) {
        val mpPage = MpUtil.getMpPage(pageParam, DatabaseTable.class);
        QueryWrapper<DatabaseTable> wrapper = new QueryWrapper<>();

        wrapper.like(StrUtil.isNotBlank(param.getTableName()), DatabaseTable.Fields.tableName, param.getTableName())
            .like(StrUtil.isNotBlank(param.getTableComment()), DatabaseTable.Fields.tableComment,
                    param.getTableComment())
            .orderByDesc(DatabaseTable.Fields.createTime, DatabaseTable.Fields.tableName);
        return databaseTableMapper.page(mpPage, wrapper);
    }

    /**
     * 获取表信息
     */
    public DatabaseTable findByTableName(String tableName) {
        return databaseTableMapper.findByTableName(tableName).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取数据表列信息
     */
    public List<DatabaseColumn> findColumnByTableName(String tableName) {
        return databaseTableMapper.findColumnByTableName(tableName);
    }

    /**
     * 获取表相关的代码生成参数信息
     */
    public TableGenParamDto getTableGenParam(String tableName) {
        DatabaseTable databaseTable = this.findByTableName(tableName);
        String entityName = CodeGenUtil.tableToJava(databaseTable.getTableName());
        return new TableGenParamDto().setEntityName(entityName).setModule(entityName.toLowerCase());
    }

}

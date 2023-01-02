package cn.bootx.starter.audit.log.handler;

import cn.bootx.common.core.annotation.BigField;
import cn.bootx.common.core.annotation.DataVersionLog;
import cn.bootx.starter.audit.log.core.db.dao.DataVersionLogDbMapper;
import cn.bootx.starter.audit.log.param.DataVersionLogParam;
import com.baomidou.mybatisplus.core.metadata.TableInfo;
import com.baomidou.mybatisplus.core.metadata.TableInfoHelper;
import com.baomidou.mybatisplus.extension.plugins.inner.DataChangeRecorderInnerInterceptor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.sf.jsqlparser.statement.update.Update;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.util.Objects;

/**
 * 数据版本记录记录插件
 * @author xxm
 * @date 2023/1/2
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class DataVersionRecordHandler extends DataChangeRecorderInnerInterceptor {

    @Lazy
    @BigField
    private final DataVersionLogDbMapper dataVersionLogService;

    @Override
    public OperationResult processUpdate(Update updateStmt, MappedStatement mappedStatement, BoundSql boundSql, Connection connection) {

        return super.processUpdate(updateStmt, mappedStatement, boundSql, connection);
    }

    /**
     * 变动结果
     * @param operationResult
     */
    @Override
    protected void dealOperationResult(OperationResult operationResult) {
        String tableName = operationResult.getTableName();
        TableInfo tableInfo = TableInfoHelper.getTableInfo(tableName);
        if (Objects.isNull(tableInfo)){
            return;
        }

        DataVersionLog annotation = tableInfo.getEntityType().getAnnotation(DataVersionLog.class);
        if (Objects.isNull(annotation)){
            return;
        }
        DataVersionLogParam dataVersionLogParam = new DataVersionLogParam()
                .setTableName(tableName)
                .setDataName(annotation.title())
                .setDataContent(operationResult.getChangedData());

//        dataVersionLogService.add(dataVersionLogParam);
        log.info("{}", operationResult);
    }
}

package cn.bootx.starter.audit.log.handler;

import cn.bootx.common.core.annotation.DataVersionLog;
import cn.bootx.common.mybatisplus.extension.DataChangeRecorderInnerInterceptor;
import cn.bootx.starter.audit.log.service.DataVersionLogService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.*;

/**
 * 数据变动记录插件
 * @author xxm
 * @date 2023/1/8
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class DataVersionRecordHandler extends DataChangeRecorderInnerInterceptor {
    // 必须延迟加载, 不然无法启动
    @Lazy
    private final DataVersionLogService dataVersionLogService;

    /**
     * 处理
     */
    @Override
    protected void dealOperationResult(OperationResult operationResult) {
        DataVersionLog annotation = operationResult.getAnnotation();
        List<DataChangedRecord> changedRecords = operationResult.getChangedRecords();
        // 遍历条信息
        for (DataChangedRecord changedRecord : changedRecords) {
            // 原始数据
            List<DataColumnChangeResult> originalColumns = Optional.ofNullable(changedRecord.getOriginalColumns())
                    .orElse(new ArrayList<>(0));
            Map<String,Object> map = new HashMap<>();
            // 遍历原始数据的所有字段
            for (DataColumnChangeResult originalColumn : originalColumns) {
                System.out.println(originalColumn.getColumnName()+":"+originalColumn.getOriginalValue());
                map.put(originalColumn.getColumnName(),originalColumn.getOriginalValue());
            }
            // 用新数据进行替换
            List<DataColumnChangeResult> updatedColumns = Optional.ofNullable(changedRecord.getUpdatedColumns())
                    .orElse(new ArrayList<>(0));
            for (DataColumnChangeResult updatedColumn : updatedColumns) {
                map.put(updatedColumn.getColumnName(),updatedColumn.getUpdateValue());
            }
            // 主键
            Object pkColumnVal = changedRecord.getPkColumnVal();
            System.out.println(map);
            System.out.println(pkColumnVal);
        }
    }
}

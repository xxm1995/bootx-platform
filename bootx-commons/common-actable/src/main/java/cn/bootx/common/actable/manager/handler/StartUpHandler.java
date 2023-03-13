package cn.bootx.common.actable.manager.handler;

import cn.bootx.common.actable.configuration.ActableProperties;
import cn.bootx.common.core.code.actable.DatabaseType;
import cn.bootx.common.actable.manager.system.SysMysqlCreateTableManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * 启动时执行处理
 *
 * @author chenbin.sun
 *
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class StartUpHandler {

    private final ActableProperties actableProperties;

    private final SysMysqlCreateTableManager sysMysqlCreateTableManager;

    /**
     * 建表开始
     */
    @PostConstruct
    public void startHandler() {
        // 获取配置信息
        DatabaseType databaseType = actableProperties.getDatabaseType();
        // 执行mysql的处理方法
        if (DatabaseType.MYSQL == databaseType) {
            log.debug("databaseType=mysql，开始执行mysql的处理方法");
            sysMysqlCreateTableManager.createMysqlTable();
        }
        else if (DatabaseType.ORACLE == databaseType) {
            log.debug("databaseType=oracle，开始执行oracle的处理方法");
        }
        else if (DatabaseType.SQLSERVER == databaseType) {
            log.debug("databaseType=sqlserver，开始执行sqlserver的处理方法");
        }
        else if (DatabaseType.POSTGRESQL == databaseType) {
            log.debug("databaseType=postgresql，开始执行postgresql的处理方法");
        }
        else {
            log.debug("没有找到符合条件的处理方法！");
        }
    }

}

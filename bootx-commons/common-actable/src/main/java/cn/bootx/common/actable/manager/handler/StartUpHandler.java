package cn.bootx.common.actable.manager.handler;


import cn.bootx.common.actable.constants.Constants;
import cn.bootx.common.actable.manager.system.SysMysqlCreateTableManager;
import cn.bootx.common.actable.manager.util.ConfigurationUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * 启动时执行处理
 * @author chenbin.sun
 *
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class StartUpHandler {


    private final ConfigurationUtil springContextUtil;

    /** 数据库类型：mysql */
    public static String MYSQL = "mysql";

    /** 数据库类型：oracle */
    public static String ORACLE = "oracle";

    /** 数据库类型：sqlserver */
    public static String SQLSERVER = "sqlserver";

    /** 数据库类型：postgresql */
    public static String POSTGRESQL = "postgresql";

    /** 数据库类型  */
    private static String databaseType = null;

    private final SysMysqlCreateTableManager sysMysqlCreateTableManager;

    /**
     * 建表开始
     */
    @PostConstruct
    public void startHandler() {
        // 获取配置信息
        databaseType = springContextUtil.getConfig(Constants.DATABASE_TYPE_KEY) == null ? MYSQL : springContextUtil.getConfig(Constants.DATABASE_TYPE_KEY);

        // 执行mysql的处理方法
        if (MYSQL.equals(databaseType)) {
            log.info("databaseType=mysql，开始执行mysql的处理方法");
            sysMysqlCreateTableManager.createMysqlTable();
        }else if (ORACLE.equals(databaseType)) {
            log.info("databaseType=oracle，开始执行oracle的处理方法");
        }else if (SQLSERVER.equals(databaseType)) {
            log.info("databaseType=sqlserver，开始执行sqlserver的处理方法");
        }else if (POSTGRESQL.equals(databaseType)) {
            log.info("databaseType=postgresql，开始执行postgresql的处理方法");
        }else{
            log.info("没有找到符合条件的处理方法！");
        }
    }
}

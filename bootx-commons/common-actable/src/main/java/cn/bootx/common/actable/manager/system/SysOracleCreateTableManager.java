package cn.bootx.common.actable.manager.system;

import cn.bootx.common.actable.constants.Constants;
import cn.bootx.common.actable.dao.system.CreateMysqlTablesMapper;
import cn.bootx.common.actable.manager.util.ConfigurationUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author sunchenbin
 * @version 2016年6月23日 下午6:07:21
 */
@Slf4j
@Component
@Transactional
@RequiredArgsConstructor
public class SysOracleCreateTableManager {


    private final CreateMysqlTablesMapper createMysqlTablesMapper;

    private final ConfigurationUtil springContextUtil;

    /**
     * 要扫描的model所在的pack
     */
    private String pack;

    /**
     * 自动创建模式：update表示更新，create表示删除原表重新创建
     */
    private String tableAuto;

    /**
     * 读取配置文件的三种状态（创建表、更新表、不做任何事情）
     */
    public void createOracleTable(){
        // 读取配置信息
        pack = springContextUtil.getConfig(Constants.MODEL_PACK_KEY);
        tableAuto = springContextUtil.getConfig(Constants.TABLE_AUTO_KEY);

        // 不做任何事情
        if("none".equals(tableAuto)){
            log.info("配置mybatis.table.auto=none，不需要做任何事情");
            return;
        }

        // TODO: 暂时还没有写
    }
}

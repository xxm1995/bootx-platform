package cn.bootx.common.actable.configuration;

import cn.bootx.common.core.code.actable.DatabaseType;
import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @author xxm
 * @date 2023/1/16
 */
@Data
@Accessors(chain = true)
@ConfigurationProperties(prefix = "bootx.common.actable")
public class ActableProperties {

    /**
     * 数据库类型
     */
    private DatabaseType databaseType = DatabaseType.MYSQL;

    /**
     * 更新模式
     */
    private UpdateType updateType = UpdateType.NONE;

    /**
     * 扫描包路径, 可以用 ,和 ; 分隔
     */
    private String scanPackage;

    /**
     * 指定生成索引前缀
     */
    private String prefixIndex = "actable_idx_";

    /**
     * 指定生成唯一约束前缀
     */
    private String prefixUnique = "actable_uni_";

    /**
     * 更新模式
     *
     * @author xxm
     * @date 2023/1/16
     */
    public enum UpdateType {

        /** 不进行任何操作 */
        NONE,
        /** 更新表结构 */
        UPDATE,
        /** 创建表, 已经创建的不再进行处理 */
        CREATE,
        /** 删除后重新创建 */
        DROP_CREATE;

    }

}

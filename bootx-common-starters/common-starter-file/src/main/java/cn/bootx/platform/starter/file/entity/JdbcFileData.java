package cn.bootx.platform.starter.file.entity;

import cn.bootx.mybatis.table.modify.annotation.DbColumn;
import cn.bootx.mybatis.table.modify.annotation.DbTable;
import cn.bootx.mybatis.table.modify.mybatis.mysq.annotation.DbMySqlFieldType;
import cn.bootx.mybatis.table.modify.mybatis.mysq.constants.MySqlFieldTypeEnum;
import cn.bootx.platform.common.mybatisplus.base.MpIdEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 数据库存储上传的文件数据
 * @author xxm
 * @since 2023/8/5
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@DbTable(comment = "上传文件数据")
@TableName("starter_file_data")
public class JdbcFileData extends MpIdEntity {

    @DbColumn(comment = "base64方式存储")
    @DbMySqlFieldType(MySqlFieldTypeEnum.LONGTEXT)
    private String base64;

    @DbColumn(comment = "base64方式存储")
    @DbMySqlFieldType(MySqlFieldTypeEnum.LONGBLOB)
    private byte[] data;
}
package cn.bootx.platform.demo.core.mtm.entity;

import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.mybatis.table.modify.annotation.DbColumn;
import cn.bootx.mybatis.table.modify.annotation.DbTable;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * actable测试
 *
 * @author xxm
 * @since 2023/1/11
 */
@EqualsAndHashCode(callSuper = true)
@DbTable(name = "mtm_table",comment = "actable测试")
@Data
@Accessors(chain = true)
@Schema(title = "cs")
public class MtmTableEntity extends MpBaseEntity {

    private String h1;

    private Date date;

    @DbColumn(ignore = true)
    private int he;

}

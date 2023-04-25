package cn.bootx.demo.core.mtm.entity;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
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
 * @date 2023/1/11
 */
@EqualsAndHashCode(callSuper = true)
@DbTable(value = "",comment = "actable测试")
@Data
@Accessors(chain = true)
@Schema(title = "cs")
public class MtmableEntity extends MpBaseEntity {

    private String h1;

    private Date date;

    @DbColumn(ignore = true)
    private int he;

}

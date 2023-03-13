package cn.bootx.demo.core.actable.entity;

import cn.bootx.common.core.annotation.actable.Column;
import cn.bootx.common.core.annotation.actable.Table;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
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
@Table(comment = "actable测试")
@Data
@Accessors(chain = true)
@Schema(title = "cs")
public class AcTableEntity extends MpBaseEntity {

    private String h1;

    private Date date;

    @Column(ignore = true)
    private int he;

}

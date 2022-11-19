package cn.bootx.common.mybatisplus.base;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.Version;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldNameConstants;

import java.time.LocalDateTime;

/**
* MP基础类, 真实删除
* @author xxm
* @date 2022/7/17
*/
@Getter
@Setter
@FieldNameConstants(innerTypeName="Del")
public abstract class MpDelEntity extends MpCreateEntity{

    /** 最后修者ID */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long lastModifier;

    /** 最后修改时间 */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime lastModifiedTime;

    /** 乐观锁 */
    @Version
    private Integer version = 0;
}

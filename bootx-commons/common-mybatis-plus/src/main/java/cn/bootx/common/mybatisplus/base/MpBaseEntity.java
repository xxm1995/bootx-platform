package cn.bootx.common.mybatisplus.base;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldNameConstants;

import java.io.Serializable;
import java.time.LocalDateTime;

/**   
* 基础实体类
* @author xxm  
* @date 2021/7/27 
*/
@Getter
@Setter
@FieldNameConstants
public class MpBaseEntity  extends MpIdEntity implements Serializable {
    private static final long serialVersionUID = -2699324766101179583L;

    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /** 创建者ID */
    @TableField(fill = FieldFill.INSERT)
    private Long creator;

    /** 创建时间 */
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /** 最后修者ID */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long lastModifier;

    /** 最后修改时间 */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime lastModifiedTime;

    /** 删除标志 */
    @TableLogic
    private boolean deleted;

    /** 乐观锁 */
    @Version
    private Integer version = 0;
}

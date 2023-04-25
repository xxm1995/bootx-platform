package cn.bootx.common.mybatisplus.base;

import cn.bootx.mybatis.table.modify.annotation.DbColumn;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldNameConstants;

import java.io.Serializable;

/**
 * mybatis plus id实体
 *
 * @author xxm
 * @date 2021/8/17
 */
@Getter
@Setter
@FieldNameConstants(innerTypeName = "Id")
public abstract class MpIdEntity implements Serializable {

    private static final long serialVersionUID = 3982181843202226124L;

    @DbColumn(comment = "主键", isKey = true, order = Integer.MIN_VALUE + 100)
    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

}

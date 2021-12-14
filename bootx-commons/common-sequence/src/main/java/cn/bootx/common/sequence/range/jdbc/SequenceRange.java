package cn.bootx.common.sequence.range.jdbc;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**   
* 队列区间
* @author xxm  
* @date 2021/12/14 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("starter_sequence_range")
public class SequenceRange extends MpBaseEntity {

    /** 区间key */
    private String rangeKey;

    /** 区间开始值 */
    private Long rangeValue;
}

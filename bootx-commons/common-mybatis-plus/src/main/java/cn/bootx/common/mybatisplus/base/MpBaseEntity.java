package cn.bootx.common.mybatisplus.base;

import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldNameConstants;

import java.io.Serializable;

/**   
* 基础实体类 (带软删除)
* @author xxm  
* @date 2021/7/27 
*/
@Getter
@Setter
@FieldNameConstants
public class MpBaseEntity extends MpDelEntity implements Serializable {
    private static final long serialVersionUID = -2699324766101179583L;


    /** 删除标志 */
    @TableLogic
    private boolean deleted;
}

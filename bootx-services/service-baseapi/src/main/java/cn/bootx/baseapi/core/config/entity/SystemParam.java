package cn.bootx.baseapi.core.config.entity;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**   
* 系统参数
* @author xxm  
* @date 2021/10/25 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
public class SystemParam extends MpBaseEntity {

    /** 参数名称 */
    private String name;

    /** 参数键名 */
    private String key;

    /** 参数值 */
    private String value;

    /** 系统参数 */
    private Boolean system;

    /** 备注 */
    private String mark;
}

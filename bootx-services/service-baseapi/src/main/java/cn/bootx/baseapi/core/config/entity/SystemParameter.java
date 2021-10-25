package cn.bootx.baseapi.core.config.entity;

import cn.bootx.baseapi.core.config.convert.SystemConvert;
import cn.bootx.baseapi.dto.system.SystemParameterDto;
import cn.bootx.baseapi.param.system.SystemParameterParam;
import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
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
@TableName("sys_param")
public class SystemParameter extends MpBaseEntity implements EntityBaseFunction<SystemParameterDto> {

    /** 参数名称 */
    private String name;

    /** 参数键名 */
    private String key;

    /** 参数值 */
    private String value;

    /** 系统参数 */
    private boolean system;

    /** 备注 */
    private String mark;

    @Override
    public SystemParameterDto toDto() {
        return SystemConvert.CONVERT.convert(this);
    }

    public static SystemParameter init(SystemParameterParam in){
        return SystemConvert.CONVERT.convert(in);
    }
}

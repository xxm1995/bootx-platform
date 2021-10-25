package cn.bootx.baseapi.dto.system;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
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
@ApiModel("系统参数")
public class SystemParameterDto extends BaseDto {

    /** 参数名称 */
    private String name;

    /** 参数键名 */
    private String key;

    /** 参数值 */
    private String value;

    /** 是否系统参数 */
    private boolean system;

    /** 备注 */
    private String mark;
}

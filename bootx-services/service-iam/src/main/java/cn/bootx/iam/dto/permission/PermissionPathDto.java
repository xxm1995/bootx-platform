package cn.bootx.iam.dto.permission;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "权限资源")
public class PermissionPathDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = -8909568804160122987L;

    /** 权限的标识 */
    private String code;

    /** 权限名称 */
    private String name;

    /** 启用 */
    private boolean enable;

    /** 权限描述 */
    private String description;

}

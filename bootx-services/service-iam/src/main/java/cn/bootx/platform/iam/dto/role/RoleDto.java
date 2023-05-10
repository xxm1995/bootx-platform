package cn.bootx.platform.iam.dto.role;

import cn.bootx.platform.common.core.rest.dto.BaseDto;
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
@Schema(title = "角色")
public class RoleDto extends BaseDto implements Serializable {

    private static final long serialVersionUID = 5532196699667233754L;

    @Schema(description = "角色code")
    private String code;

    @Schema(description = "角色名称")
    private String name;

    @Schema(description = "是否系统内置 Y 内置 N 不是  内置 不能修改")
    private boolean internal;

    @Schema(description = "描述")
    private String remark;

}

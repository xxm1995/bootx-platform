package cn.bootx.iam.param.upms;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
* @author xxm
* @date 2021/6/9
*/
@Data
@Accessors(chain = true)
@Schema(title = "角色权限")
public class RolePermissionParam implements Serializable {
    private static final long serialVersionUID = 4344723093613370279L;

    @Schema(name = "角色的ID")
    private Long roleId;

    @Schema(name = "权限id")
    private List<Long> permissionIds;
}

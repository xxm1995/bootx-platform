package cn.bootx.iam.param.upms;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.List;

/**
 * @author xxm
 * @date 2021/6/9
 */
@Data
@Accessors(chain = true)
@Schema(title = "角色权限(菜单/)")
public class RolePermissionParam implements Serializable {

    private static final long serialVersionUID = 4344723093613370279L;

    @Schema(description = "角色的ID")
    @NotNull(message = "角色不可为空")
    private Long roleId;

    @Schema(description = "终端code")
    @NotBlank(message = "终端不可为空", groups = { PermMenu.class })
    private String clientCode;

    @Schema(description = "权限id")
    private List<Long> permissionIds;

    public interface PermMenu {

    }

}

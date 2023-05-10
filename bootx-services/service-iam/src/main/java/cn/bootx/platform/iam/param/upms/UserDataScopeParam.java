package cn.bootx.platform.iam.param.upms;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * @author xxm
 * @date 2022/1/2
 */
@Data
@Schema(title = "用户数据权限参数")
public class UserDataScopeParam {

    @Schema(description = "用户的ID", required = true)
    @NotNull(message = "用户 ID 不能为空")
    private Long userId;

    @Schema(description = "数据权限的ID集合", required = true)
    private Long dataScopeId;

}

package cn.bootx.iam.param.upms;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.util.List;

/**
 * @author xxm
 * @date 2022/6/7
 */
@Data
@Schema(title = "用户数据权限批量设置参数")
public class UserDataScopeBatchParam {

    @Schema(description = "用户的ID", required = true)
    @NotEmpty(message = "用户集合不能为空")
    private List<Long> userIds;

    @Schema(description = "数据权限的ID集合", required = true)
    private Long dataScopeId;

}

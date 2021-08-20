package cn.bootx.iam.param.upms;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
* @author xxm
* @date 2020/5/1 18:10
*/
@Data
@ApiModel(value = "角色用户参数")
public class RoleUsersParam {

    @ApiModelProperty(name = "userIds", value = "用户的ID集合", required = true)
    @NotNull(message = "用户 ID 不能为空")
    private List<Long> userIds;

    @ApiModelProperty(name = "roleId", value = "角色的ID", required = true)
    @NotNull(message = "roleId 不能为空")
    private Long roleId;

}

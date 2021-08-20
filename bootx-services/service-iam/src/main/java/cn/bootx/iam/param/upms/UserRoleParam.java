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
@ApiModel(value = "用户角色参数")
public class UserRoleParam {

    @ApiModelProperty(name = "userId", value = "用户的ID", required = true)
    @NotNull(message = "用户 ID 不能为空")
    private Long userId;

    @ApiModelProperty(name = "roleIds", value = "角色的ID集合", required = true)
    @NotNull(message = "roleIds 不能为空")
    private List<Long> roleIds;

}

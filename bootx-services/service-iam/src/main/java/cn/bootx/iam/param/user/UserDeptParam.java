package cn.bootx.iam.param.user;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
* @author xxm
* @date 2021/9/29
*/
@Data
@Accessors(chain = true)
@ApiModel("用户")
public class UserDeptParam {
    @ApiModelProperty("用户id")
    private Long userId;

    @ApiModelProperty("部门ids")
    private List<Long> deptIds;
}

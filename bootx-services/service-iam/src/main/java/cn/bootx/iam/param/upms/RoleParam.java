package cn.bootx.iam.param.upms;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* @author xxm
* @date 2021/6/17
*/
@Data
@Accessors(chain = true)
@ApiModel("角色")
public class RoleParam {

    @ApiModelProperty("角色id")
    private Long id;

    @ApiModelProperty("角色code")
    private String code;

    @ApiModelProperty("角色名称")
    private String name;

    @ApiModelProperty("描述")
    private String description;
}

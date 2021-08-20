package cn.bootx.iam.dto.upms;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/5/1 11:20
*/
@EqualsAndHashCode(callSuper = true)
@Data
@ApiModel(value = "用户角色的DTO")
public class UserRoleDto  extends BaseDto implements Serializable {

    @ApiModelProperty(name = "userId", value = "用户ID")
    private Long userId;

    @ApiModelProperty(name = "roleId", value = "角色ID")
    private Long roleId;

    @ApiModelProperty(name = "description", value = "描述")
    private String description;

}

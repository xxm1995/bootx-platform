package cn.bootx.iam.dto.user;

import cn.bootx.iam.dto.dept.DeptDto;
import cn.bootx.iam.dto.upms.RoleDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
*
* @author xxm
* @date 2021/9/29
*/
@Data
@Accessors(chain = true)
@ApiModel("用户完整信息")
public class UserInfoWhole {

    @ApiModelProperty("用户信息")
    private UserInfoDto userInfo;

    @ApiModelProperty("角色信息")
    private List<RoleDto> roles;

    @ApiModelProperty("部门信息")
    private List<DeptDto> deptList;

}

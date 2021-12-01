package cn.bootx.iam.dto.user;

import cn.bootx.iam.dto.dept.DeptDto;
import cn.bootx.iam.dto.upms.RoleDto;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
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
@Schema(title = "用户完整信息")
public class UserInfoWhole {

    @Schema(name = "用户信息")
    private UserInfoDto userInfo;

    @Schema(name = "角色信息")
    private List<RoleDto> roles;

    @Schema(name = "部门信息")
    private List<DeptDto> deptList;

}

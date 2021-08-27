package cn.bootx.iam.dto.upms;

import cn.bootx.iam.dto.permission.PermissionMenuDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**   
* 用户菜单及按钮权限返回类
* @author xxm  
* @date 2021/8/25 
*/
@Data
@Accessors(chain = true)
@ApiModel("用户菜单及按钮权限数据类")
public class UserMenuAndButtonDto {

    @ApiModelProperty("按钮权限集合")
    private List<String> buttonPermissions;

    @ApiModelProperty("菜单")
    private List<PermissionMenuDto> menus;
}

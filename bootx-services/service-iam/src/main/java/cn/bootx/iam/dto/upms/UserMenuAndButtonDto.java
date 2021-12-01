package cn.bootx.iam.dto.upms;

import cn.bootx.iam.dto.permission.PermissionMenuDto;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
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
@Schema(title = "用户菜单及按钮权限数据类")
public class UserMenuAndButtonDto {

    @Schema(name = "按钮权限集合")
    private List<String> buttonPermissions;

    @Schema(name = "菜单")
    private List<PermissionMenuDto> menus;
}

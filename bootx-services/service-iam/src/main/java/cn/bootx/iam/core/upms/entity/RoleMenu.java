package cn.bootx.iam.core.upms.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**   
* 角色权限关联关系
* @author xxm  
* @date 2021/8/3 
*/
@Data
@Accessors(chain = true)
@TableName("iam_role_menu")
@NoArgsConstructor
public class RoleMenu {

    @TableId
    private Long id;
    /**
     * 角色id
     */
    private Long roleId;

    /**
     * 菜单权限id
     */
    private Long permissionId;

    public RoleMenu(Long roleId, Long permissionId) {
        this.roleId = roleId;
        this.permissionId = permissionId;
    }
}

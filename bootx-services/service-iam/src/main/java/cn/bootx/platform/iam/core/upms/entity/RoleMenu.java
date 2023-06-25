package cn.bootx.platform.iam.core.upms.entity;

import cn.bootx.platform.common.mybatisplus.base.MpIdEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * 角色权限关联关系
 *
 * @author xxm
 * @since 2021/8/3
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("iam_role_menu")
@NoArgsConstructor
public class RoleMenu extends MpIdEntity {

    /**
     * 角色id
     */
    private Long roleId;

    /**
     * 终端类型
     */
    private String clientCode;

    /**
     * 菜单权限id
     */
    private Long permissionId;

    public RoleMenu(Long roleId, String clientCode, Long permissionId) {
        this.roleId = roleId;
        this.clientCode = clientCode;
        this.permissionId = permissionId;
    }

}

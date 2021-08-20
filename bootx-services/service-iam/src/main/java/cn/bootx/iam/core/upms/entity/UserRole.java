package cn.bootx.iam.core.upms.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * 用户角色关系
 * @author xxm
 * @date 2020/5/1 11:18
 */
@Data
@Accessors(chain = true)
@TableName("iam_user_role")
@NoArgsConstructor
public class UserRole {

    @TableId
    private Long id;

    /** 用户 */
    private Long userId;

    /** 角色 */
    private Long roleId;
}

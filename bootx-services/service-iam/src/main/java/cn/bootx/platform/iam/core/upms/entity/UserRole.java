package cn.bootx.platform.iam.core.upms.entity;

import cn.bootx.platform.common.mybatisplus.base.MpIdEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * 用户角色关系
 *
 * @author xxm
 * @since 2020/5/1 11:18
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("iam_user_role")
@NoArgsConstructor
public class UserRole extends MpIdEntity {

    /** 用户 */
    private Long userId;

    /** 角色 */
    private Long roleId;

}

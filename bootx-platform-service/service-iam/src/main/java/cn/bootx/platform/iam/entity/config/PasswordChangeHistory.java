package cn.bootx.platform.iam.entity.config;

import cn.bootx.platform.common.mybatisplus.base.MpCreateEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 密码更改历史
 * @author xxm
 * @since 2024/12/2
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
public class PasswordChangeHistory extends MpCreateEntity {
}

package cn.bootx.platform.iam.dto.security;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 用户将进行哪些安全状态的检查
 * @author xxm
 * @since 2023/9/25
 */
@Data
@Accessors(chain = true)
@Schema(title = "用户将进行哪些状态的检查")
public class UserCheckSecurityResult {

    @Schema(description = "是否进行安全检查")
    private Boolean requireChangePwd;

    @Schema(description = "是否进行密码修改倒计时提醒")
    private Boolean expireRemindPwd;

    @Schema(description = "是否进行密码修改验证")
    private Boolean expireChangePwd;

}

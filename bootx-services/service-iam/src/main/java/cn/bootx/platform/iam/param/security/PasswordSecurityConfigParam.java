package cn.bootx.platform.iam.param.security;

import cn.bootx.platform.common.core.annotation.QueryParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 密码安全策略
 * @author xxm
 * @since 2023-09-20
 */
@QueryParam(type = QueryParam.CompareTypeEnum.LIKE)
@Data
@Schema(title = "密码安全策略")
@Accessors(chain = true)
public class PasswordSecurityConfigParam {

    @Schema(description= "主键")
    private Long id;

    @Schema(description = "最大密码错误数")
    private Integer maxPwdErrorCount;
    @Schema(description = "密码错误锁定时间(分钟)")
    private Integer errorLockTime;
    @Schema(description = "强制修改初始密码")
    private Boolean requireChangePwd;
    @Schema(description = "更新频率")
    private Integer updateFrequency;
    @Schema(description = "到期提醒(天数)")
    private Integer expireRemind;
    @Schema(description = "与登录名相同")
    private Boolean sameAsLoginName;
    @Schema(description = "不能与近期多少次密码相同")
    private Integer recentPassword;

}

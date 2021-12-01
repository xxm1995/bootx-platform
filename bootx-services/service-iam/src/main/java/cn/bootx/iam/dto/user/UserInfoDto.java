package cn.bootx.iam.dto.user;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.enums.SensitiveType;
import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.common.jackson.sensitive.SensitiveInfo;
import cn.bootx.iam.code.UserStatusCode;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

;


@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "用户信息")
public class UserInfoDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = 5881350477107722635L;

    @Schema(description= "名称")
    private String name;

    @Schema(description= "账号")
    private String username;

    @Schema(description= "密码")
    @SensitiveInfo(SensitiveType.PASSWORD)
    private String password;

    @Schema(description= "手机号")
    @SensitiveInfo(SensitiveType.MOBILE_PHONE)
    private String phone;

    @Schema(description= "邮箱")
    @SensitiveInfo(SensitiveType.EMAIL)
    private String email;

    @Schema(description= "注册来源")
    private String source;

    @Schema(description= "头像")
    private String avatar;

    @Schema(description= "是否管理员")
    private boolean admin;

    /**
     * @see UserStatusCode
     */
    @Schema(description= "账号状态")
    private Integer status;

    @Schema(description= "注册时间")
    private LocalDateTime registerTime;

    @Schema(description= "最后登录时间", accessMode = Schema.AccessMode.READ_ONLY)
    private LocalDateTime lastLoginTime;

    public UserDetail toUserDetail(){
        return new UserDetail()
                .setId(this.getId())
                .setPassword(this.password)
                .setUsername(this.getUsername())
                .setName(this.name)
                .setAdmin(this.admin)
                .setStatus(this.status);
    }
}

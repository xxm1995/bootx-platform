package cn.bootx.iam.dto.user;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.iam.code.UserStatusCode;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

import static io.swagger.annotations.ApiModelProperty.AccessMode.READ_ONLY;

@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel("用户信息")
public class UserInfoDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = 5881350477107722635L;

    @ApiModelProperty("名称")
    private String name;

    @ApiModelProperty("账号")
    private String username;

    @ApiModelProperty("密码")
    @JsonIgnore
    private String password;

    @ApiModelProperty("手机号")
    private String phone;

    @ApiModelProperty("邮箱")
    private String email;

    @ApiModelProperty("注册来源")
    private String source;

    @ApiModelProperty("头像")
    private String avatar;

    @ApiModelProperty("是否管理员")
    private boolean admin;

    /**
     * @see UserStatusCode
     */
    @ApiModelProperty("账号状态")
    private Integer status;

    @ApiModelProperty("注册时间")
    private LocalDateTime registerTime;

    @ApiModelProperty(value = "最后登录时间", accessMode = READ_ONLY)
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

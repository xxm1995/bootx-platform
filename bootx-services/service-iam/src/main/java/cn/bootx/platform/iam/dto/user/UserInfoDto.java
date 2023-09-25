package cn.bootx.platform.iam.dto.user;

import cn.bootx.platform.common.core.entity.UserDetail;
import cn.bootx.platform.common.core.rest.dto.BaseDto;
import cn.bootx.platform.iam.code.UserStatusCode;
import cn.bootx.platform.starter.data.perm.sensitive.SensitiveInfo;
import cn.hutool.core.collection.CollUtil;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author xxm
 * @since 2020/4/24
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "用户信息")
public class UserInfoDto extends BaseDto implements Serializable {

    private static final long serialVersionUID = 5881350477107722635L;

    @Schema(description = "用户id")
    private Long id;

    @Schema(description = "名称")
    private String name;

    @Schema(description = "账号")
    private String username;

    @Schema(description = "密码")
    @SensitiveInfo(SensitiveInfo.SensitiveType.PASSWORD)
    private String password;

    @Schema(description = "手机号")
    @SensitiveInfo(SensitiveInfo.SensitiveType.MOBILE_PHONE)
    private String phone;

    @Schema(description = "邮箱")
    @SensitiveInfo(SensitiveInfo.SensitiveType.EMAIL)
    private String email;

    @Schema(description = "终端id列表")
    private List<String> clientIdList = new ArrayList<>();

    @Schema(description = "是否管理员")
    private boolean admin;

    /**
     * @see UserStatusCode
     */
    @Schema(description = "账号状态")
    private Integer status;

    @Schema(description = "注册时间")
    private LocalDateTime registerTime;

    public UserDetail toUserDetail() {
        List<Long> clientIds = new ArrayList<>();
        if (CollUtil.isNotEmpty(this.getClientIdList())) {
            clientIds = this.getClientIdList().stream().map(Long::valueOf).collect(Collectors.toList());
        }
        return new UserDetail().setId(this.getId())
            .setPassword(this.password)
            .setUsername(this.getUsername())
            .setName(this.name)
            .setAdmin(this.admin)
            .setAppIds(clientIds)
            .setStatus(this.status);
    }

}

package cn.bootx.platform.iam.core.user.entity;

import cn.bootx.platform.common.core.entity.UserDetail;
import cn.bootx.platform.common.core.function.EntityBaseFunction;
import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.platform.iam.code.UserStatusCode;
import cn.bootx.platform.iam.core.user.convert.UserConvert;
import cn.bootx.platform.iam.dto.user.UserInfoDto;
import cn.bootx.platform.iam.param.user.UserInfoParam;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 用户的核心信息
 *
 * @author xxm
 * @since 2020/4/24 15:21
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("iam_user_info")
public class UserInfo extends MpBaseEntity implements EntityBaseFunction<UserInfoDto> {

    /** 名称 */
    private String name;

    /** 账号 */
    private String username;

    /** 密码 */
    private String password;

    /** 手机号 */
    private String phone;

    /** 邮箱 */
    private String email;

    /** 关联终端id集合 */
    private String clientIds;

    /** 是否管理员 */
    @TableField("`admin`")
    private boolean admin;

    /**
     * 账号状态
     * @see UserStatusCode
     */
    private Integer status;

    @Override
    public UserInfoDto toDto() {
        UserInfoDto userInfoDto = UserConvert.CONVERT.convert(this);
        if (StrUtil.isNotBlank(this.getClientIds())) {
            List<String> collect = Arrays.stream(this.getClientIds().split(",")).collect(Collectors.toList());
            userInfoDto.setClientIdList(collect);
        }
        return userInfoDto;
    }

    public static UserInfo init(UserInfoParam param) {
        UserInfo userInfo = UserConvert.CONVERT.convert(param);
        if (CollUtil.isNotEmpty(param.getClientIdList())) {
            String appIds = String.join(",", param.getClientIdList());
            userInfo.setClientIds(appIds);
        }
        return userInfo;
    }

    public UserDetail toUserDetail() {
        return new UserDetail().setId(this.getId())
            .setPassword(this.password)
            .setUsername(this.getUsername())
            .setName(this.name)
            .setAdmin(this.admin)
            .setStatus(this.status);
    }

}

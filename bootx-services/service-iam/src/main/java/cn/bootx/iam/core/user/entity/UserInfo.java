package cn.bootx.iam.core.user.entity;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.iam.code.UserStatusCode;
import cn.bootx.iam.core.user.convert.UserConvert;
import cn.bootx.iam.dto.user.UserInfoDto;
import cn.bootx.iam.param.user.UserInfoParam;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 用户的核心信息
 *
 * @author xxm
 * @date 2020/4/24 15:21
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

    /** 注册来源 */
    private String source;

    /** 是否管理员 */
    private boolean admin;

    /**
     * 账号状态
     * @see UserStatusCode
     */
    private Integer status;

    /** 注册时间 */
    private LocalDateTime registerTime;

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
        return new UserDetail().setId(this.getId()).setPassword(this.password).setUsername(this.getUsername())
                .setName(this.name).setAdmin(this.admin).setStatus(this.status);
    }

}

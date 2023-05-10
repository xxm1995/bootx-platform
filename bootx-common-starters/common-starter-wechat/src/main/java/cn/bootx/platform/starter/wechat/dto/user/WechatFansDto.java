package cn.bootx.platform.starter.wechat.dto.user;

import cn.bootx.platform.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 微信公众号粉丝
 *
 * @author xxm
 * @date 2022-07-16
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(title = "微信公众号粉丝")
@Accessors(chain = true)
public class WechatFansDto extends BaseDto {

    @Schema(description = "关联OpenId")
    private String openid;

    @Schema(description = "订阅状态")
    private Boolean subscribeStatus;

    @Schema(description = "订阅时间")
    private LocalDateTime subscribeTime;

    @Schema(description = "昵称")
    private String nickname;

    @Schema(description = "性别")
    private String sex;

    @Schema(description = "语言")
    private String language;

    @Schema(description = "国家")
    private String country;

    @Schema(description = "省份")
    private String province;

    @Schema(description = "城市")
    private String city;

    @Schema(description = "头像地址")
    private String avatarUrl;

    @Schema(description = "备注")
    private String remark;

}

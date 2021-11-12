package cn.bootx.starter.auth.online;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;
import java.util.List;

/**
*
* @author xxm
* @date 2021/9/8
*/
@Data
@Accessors(chain = true)
@ApiModel("在线用户")
public class OnlineUserDto {
    @ApiModelProperty("用户id")
    private Long userId;
    @ApiModelProperty("会话id")
    private String sessionId;
    @ApiModelProperty("用户名称")
    private String name;
    @ApiModelProperty("用户账号")
    private String userName;
    @ApiModelProperty("创建时间")
    private LocalDateTime creationTime;
    @ApiModelProperty("剩余有效时间(秒)")
    private Long timeout;
    @ApiModelProperty("Token列表")
    private List<TokenSign> tokenSigns;

    @Data
    @Accessors(chain = true)
    @ApiModel("Token签名")
    public static class TokenSign{

        @ApiModelProperty("token值")
        private String value;

        @ApiModelProperty("所在设备标识")
        private String device;
    }
}

package cn.bootx.starter.auth.online;

import io.swagger.v3.oas.annotations.media.Schema;
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
@Schema(title = "在线用户")
public class OnlineUserDto {
    @Schema(name = "用户id")
    private Long userId;
    @Schema(name = "会话id")
    private String sessionId;
    @Schema(name = "用户名称")
    private String name;
    @Schema(name = "用户账号")
    private String userName;
    @Schema(name = "创建时间")
    private LocalDateTime creationTime;
    @Schema(name = "剩余有效时间(秒)")
    private Long timeout;
    @Schema(name = "Token列表")
    private List<TokenSign> tokenSigns;

    @Data
    @Accessors(chain = true)
    @Schema(title = "Token签名")
    public static class TokenSign{

        @Schema(name = "token值")
        private String value;

        @Schema(name = "所在设备标识")
        private String device;
    }
}

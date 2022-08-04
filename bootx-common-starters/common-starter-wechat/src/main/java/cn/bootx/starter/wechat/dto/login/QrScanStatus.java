package cn.bootx.starter.wechat.dto.login;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 *
 * @author xxm
 * @date 2022/8/4
 */
@Data
@Accessors(chain = true)
@Schema(title = "登录二维码扫描状态")
public class QrScanStatus {

    @Schema(description = "状态")
    private String status;

    @Schema(description = "openId")
    private String openId;
}

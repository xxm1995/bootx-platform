package cn.bootx.baseapi.dto.captcha;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* 验证码数据
* @author xxm
* @date 2021/8/2
*/
@Data
@Accessors(chain = true)
@Schema(title = "验证码数据")
public class CaptchaDataResult {
    @Schema(name = "验证码标示")
    private String captchaKey;

    @Schema(name = "验证码base64数据")
    private String captchaData;
}

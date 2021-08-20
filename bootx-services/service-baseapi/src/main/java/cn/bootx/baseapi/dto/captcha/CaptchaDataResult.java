package cn.bootx.baseapi.dto.captcha;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* 验证码数据
* @author xxm
* @date 2021/8/2
*/
@Data
@Accessors(chain = true)
@ApiModel("验证码数据")
public class CaptchaDataResult {
    @ApiModelProperty("验证码标示")
    private String captchaKey;

    @ApiModelProperty("验证码base64数据")
    private String captchaData;
}

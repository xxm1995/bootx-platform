package cn.bootx.notice.dto.dingtalk;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel("钉钉机器人配置")
public class DingRobotConfigDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = -5642207413191556792L;

    /** 编号 */
    private String code;

    /** 配置名称 */
    private String name;

    /** 钉钉机器人的accessToken */
    private String accessToken;

    /** 是否开启验签 */
    private boolean enableSignatureCheck;

    /** 验签秘钥 */
    private String signSecret;
}

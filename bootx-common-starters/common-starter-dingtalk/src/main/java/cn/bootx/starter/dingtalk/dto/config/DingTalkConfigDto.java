package cn.bootx.starter.dingtalk.dto.config;

import cn.bootx.common.core.enums.SensitiveType;
import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.starter.data.perm.sensitive.SensitiveInfo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 钉钉配置
* @author xxm
* @date 2022/4/3
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "钉钉配置")
public class DingTalkConfigDto extends BaseDto {

    @Schema(description = "名称")
    private String name;

    @Schema(description = "AppKey")
    @SensitiveInfo(value = SensitiveType.OTHER)
    private String appKey;

    @Schema(description = "AppSecret")
    @SensitiveInfo(value = SensitiveType.OTHER)
    private String appSecret;

    @Schema(description = "是否启用")
    private Boolean enable;

    @Schema(description = "备注")
    private String remark;
}

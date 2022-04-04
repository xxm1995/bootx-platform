package cn.bootx.starter.dingtalk.param.config;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* 钉钉配置
* @author xxm
* @date 2022/4/3
*/
@Data
@Accessors(chain = true)
@Schema(title = "钉钉配置")
public class DingTalkConfigParam {

    @Schema(description = "主键")
    private Long id;
    
    @Schema(description = "名称")
    private String name;

    @Schema(description = "AppKay")
    private String appKay;

    @Schema(description = "AppSecret")
    private String appSecret;

    @Schema(description = "是否启用")
    private Boolean enable;

    @Schema(description = "备注")
    private String remark;
}

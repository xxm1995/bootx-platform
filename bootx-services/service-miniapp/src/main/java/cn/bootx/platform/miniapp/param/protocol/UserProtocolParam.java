package cn.bootx.platform.miniapp.param.protocol;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 用户协议
 * @author xxm
 * @since 2023-08-02
 */
@Data
@Schema(title = "用户协议")
@Accessors(chain = true)
public class UserProtocolParam {

    @Schema(description= "主键")
    private Long id;

    @Schema(description = "编码")
    private String code;
    @Schema(description = "内容")
    private String content;
    @Schema(description = "备注")
    private String remark;
}

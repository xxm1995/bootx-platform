package cn.bootx.platform.miniapp.dto.protocol;

import cn.bootx.platform.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 用户协议
 * @author xxm
 * @since 2023-08-02
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(title = "用户协议")
@Accessors(chain = true)
public class UserProtocolDto extends BaseDto {

    @Schema(description = "编码")
    private String code;
    @Schema(description = "内容")
    private String content;
    @Schema(description = "备注")
    private String remark;

}

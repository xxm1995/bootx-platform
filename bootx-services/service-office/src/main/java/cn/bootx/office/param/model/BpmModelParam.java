package cn.bootx.office.param.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 *
 * @author xxm
 * @date 2022/8/23
 */
@Data
@Accessors(chain = true)
@Schema(title = "流程模型添加参数")
public class BpmModelParam {


    @Schema(description = "流程模型ID")
    private Long id;
    @Schema(description = "流程类型ID")
    private Long typeId;
    @Schema(description = "流程类型")
    private String typeKey;
}

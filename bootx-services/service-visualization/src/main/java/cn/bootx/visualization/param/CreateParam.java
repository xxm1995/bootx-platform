package cn.bootx.visualization.param;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * GoView项目创建参数
 * @author xxm
 * @date 2023/2/21
 */
@Data
@Schema(description = "GoView项目创建参数")
public class CreateParam {

    @Schema(description = "项目名称")
    private String projectName;

    @Schema(description = "备注")
    private String remark;

}

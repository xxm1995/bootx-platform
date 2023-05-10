package cn.bootx.platform.visualization.param;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author xxm
 * @date 2023/3/3
 */
@Data
@Accessors(chain = true)
@Schema(title = "GoView项目修改参数(后台 )")
public class ProjectInfoParam {

    @Schema(description = "主键")
    private Long id;

    @Schema(description = "项目名称")
    private String name;

    @Schema(description = "备注")
    private String remark;

}

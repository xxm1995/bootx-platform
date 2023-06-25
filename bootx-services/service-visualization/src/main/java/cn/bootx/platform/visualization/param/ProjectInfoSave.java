package cn.bootx.platform.visualization.param;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Map;

/**
 * 大屏更新参数
 *
 * @author xxm
 * @since 2023/2/21
 */
@Data
@Accessors(chain = true)
@Schema(title = "更新参数")
public class ProjectInfoSave {

    @Schema(description = "主键")
    private Long projectId;

    @Schema(description = "项目名称")
    private String name;

    @Schema(description = "状态")
    private Integer state;

    @Schema(description = "报表内容")
    private Map<String, Object> content;

    @Schema(description = "预览图片id")
    private Long indexImage;

    @Schema(description = "备注")
    private String remark;

}

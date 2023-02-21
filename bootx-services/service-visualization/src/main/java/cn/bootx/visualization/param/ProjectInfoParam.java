package cn.bootx.visualization.param;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Map;

/**
 *
 * @author xxm
 * @date 2023/2/21
 */
@Data
@Accessors(chain = true)
@Schema(title = "更新参数")
public class ProjectInfoParam {

    @Schema(description = "主键")
    private Long projectId;

    @Schema(description = "项目名称")
    private String name;

    @Schema(description = "状态")
    private Integer status;

    @Schema(description = "报表内容")
    private Map<String,Object> content;

    @Schema(description = "预览图片地址")
    private String picUrl;

    @Schema(description = "备注")
    private String remark;
}

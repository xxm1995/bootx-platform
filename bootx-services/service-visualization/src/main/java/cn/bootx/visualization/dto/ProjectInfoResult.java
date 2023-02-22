package cn.bootx.visualization.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 项目大屏信息
 * @author xxm
 * @date 2023/2/21
 */
@Data
@Accessors(chain = true)
@Schema(description = "项目大屏信息")
public class ProjectInfoResult {

    @Schema(description = "主键")
    private Long id;

    @Schema(description = "项目名称")
    private String projectName;

    @Schema(description = "发布状态")
    private Integer state;

    @Schema(description = "报表内容")
    private String content;

    @Schema(description = "预览图片(会拼接成完整请求地址)")
    private String indexImage;

    @Schema(description = "项目备注")
    private String remarks;

}

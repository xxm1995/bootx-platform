package cn.bootx.visualization.param;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 发布/取消发布参数
 * @author xxm
 * @date 2023/2/21
 */
@Data
@Accessors(chain = true)
@Schema(title = "")
public class PublishParam {

    @Schema(description = "主键")
    private Long id;

    @Schema(description = "发布状态 -1 未发布, 1 已发布")
    private Integer state;
}

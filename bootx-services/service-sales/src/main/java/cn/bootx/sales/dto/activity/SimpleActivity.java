package cn.bootx.sales.dto.activity;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* @author xxm
* @date 2021/5/19
*/
@Data
@Accessors(chain = true)
@Schema(title = "活动简单展示")
public class SimpleActivity {

    @Schema(name = "主键")
    private Long id;

    @Schema(name = "名称")
    private String name;

    @Schema(name = "描述")
    private String description;

    @Schema(name = "活动互斥")
    private String activityMutual;
}

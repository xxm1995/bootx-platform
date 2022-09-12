package cn.bootx.sales.dto.activity;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
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

    @Schema(description= "主键")
    private Long id;

    @Schema(description= "名称")
    private String name;

    @Schema(description= "描述")
    private String description;

    @Schema(description= "活动互斥")
    private String activityMutual;
}

package cn.bootx.sales.dto.activity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* @author xxm
* @date 2021/5/19
*/
@Data
@Accessors(chain = true)
@ApiModel("活动简单展示")
public class SimpleActivity {

    @ApiModelProperty("主键")
    private Long id;

    @ApiModelProperty("名称")
    private String name;

    @ApiModelProperty("描述")
    private String description;

    @ApiModelProperty("活动互斥")
    private String activityMutual;
}

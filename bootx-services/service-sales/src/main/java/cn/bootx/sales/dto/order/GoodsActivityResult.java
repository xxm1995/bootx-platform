package cn.bootx.sales.dto.order;

import cn.bootx.sales.dto.activity.SimpleActivity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
* @author xxm
* @date 2021/3/10
*/
@Data
@Accessors(chain = true)
@ApiModel("商品适用活动")
public class GoodsActivityResult implements Serializable {
    private static final long serialVersionUID = 7331502272797651564L;

    @ApiModelProperty("skuId")
    private Long skuId;

    @ApiModelProperty("活动集合")
    private List<SimpleActivity> activities;
}

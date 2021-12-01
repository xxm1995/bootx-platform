package cn.bootx.sales.dto.order;

import cn.bootx.sales.dto.activity.SimpleActivity;
import io.swagger.v3.oas.annotations.media.Schema;
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
@Schema(title = "商品适用活动")
public class GoodsActivityResult implements Serializable {
    private static final long serialVersionUID = 7331502272797651564L;

    @Schema(name = "skuId")
    private Long skuId;

    @Schema(name = "活动集合")
    private List<SimpleActivity> activities;
}

package cn.bootx.goods.param.goods;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2021/2/2
*/
@Data
@Accessors(chain = true)
@ApiModel("商品创建参数")
public class GoodsParam implements Serializable {
    private static final long serialVersionUID = -8666559882709167480L;

    @ApiModelProperty("主键")
    private Long id;

    @ApiModelProperty(value = "所属类目id", required = true)
    private Long cid;

    @ApiModelProperty(value = "所属类目名称（前端展示使用）")
    private String cname;

    @ApiModelProperty(value = "商品名称", required = true)
    private String name;

    @ApiModelProperty(value = "商品描述")
    private String description;

    @ApiModelProperty("附加信息")
    private String addition;

    @ApiModelProperty("价格表类型id")
    private Long priceTypeId;

}

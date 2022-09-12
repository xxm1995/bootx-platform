package cn.bootx.goods.param.goods;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2021/2/2
*/
@Data
@Accessors(chain = true)
@Schema(title = "商品创建参数")
public class GoodsParam implements Serializable {
    private static final long serialVersionUID = -8666559882709167480L;

    @Schema(description= "主键")
    private Long id;

    @Schema(description= "所属类目id", required = true)
    private Long cid;

    @Schema(description= "所属类目名称（前端展示使用）")
    private String cname;

    @Schema(description= "商品名称", required = true)
    private String name;

    @Schema(description= "商品描述")
    private String remark;

    @Schema(description= "附加信息")
    private String addition;

    @Schema(description= "价格表类型id")
    private Long priceTypeId;

}

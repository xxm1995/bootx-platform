package cn.bootx.goods.dto.goods;

import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.goods.dto.sku.GoodsSkuDto;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
* @author xxm
* @date 2020/11/20
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "商品DTO")
public class GoodsDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = 9191023721658520976L;

    @Schema(name = "所属类目id", required = true)
    private Long cid;

    @Schema(name = "所属类目名称（前端展示使用）")
    private String cname;

    @Schema(name = "商品名称", required = true)
    private String name;

    @Schema(name = "商品描述")
    private String description;

    /** banner图片 多个图片逗号分隔 */
    private String bannerUri;

    /** 商品介绍主图 多个图片逗号分隔 */
    private String mainUri;

    @Schema(name = "附加信息")
    private String addition;

    @Schema(name = "状态(1:可用，0:不可用)")
    private int state;

    @Schema(name = "关联sku")
    private List<GoodsSkuDto> skus;

}
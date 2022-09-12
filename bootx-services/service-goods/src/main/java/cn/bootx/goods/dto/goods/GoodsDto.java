package cn.bootx.goods.dto.goods;

import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.goods.dto.sku.GoodsSkuDto;
import io.swagger.v3.oas.annotations.media.Schema;
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

    @Schema(description= "所属类目id", required = true)
    private Long cid;

    @Schema(description= "所属类目名称（前端展示使用）")
    private String cname;

    @Schema(description= "商品名称", required = true)
    private String name;

    @Schema(description= "商品描述")
    private String remark;

    /** banner图片 多个图片逗号分隔 */
    private String bannerUri;

    /** 商品介绍主图 多个图片逗号分隔 */
    private String mainUri;

    @Schema(description= "附加信息")
    private String addition;

    @Schema(description= "状态(1:可用，0:不可用)")
    private int state;

    @Schema(description= "关联sku")
    private List<GoodsSkuDto> skus;

}
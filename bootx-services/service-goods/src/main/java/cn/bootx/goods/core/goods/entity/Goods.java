package cn.bootx.goods.core.goods.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.goods.core.goods.convert.GoodsConvert;
import cn.bootx.goods.dto.goods.GoodsDto;
import cn.bootx.goods.param.goods.GoodsParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**   
* 商品表
* @author xxm  
* @date 2020/11/19 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("gc_goods")
public class Goods extends MpBaseEntity implements EntityBaseFunction<GoodsDto> {

    /** 所属类目id */
    private Long cid;

    /** 所属类目名称 */
    private String cname;

    /** 商品名称 */
    private String name;

    /** 描述*/
    private String description;

    /** banner图片 多个图片逗号分隔 */
    private String bannerUri;

    /** 商品介绍主图 多个图片逗号分隔 */
    private String mainUri;

    /** 显示上限价格 */
    private BigDecimal displayUpperPrice;

    /** 显示下限价格 */
    private BigDecimal displayLowerPrice;

    /** 状态(1:可用，0:不可用) */
    private int state;

    public static Goods init(GoodsDto in){
        return GoodsConvert.CONVERT.convert(in);
    }

    public static Goods init(GoodsParam in){
        return GoodsConvert.CONVERT.convert(in);
    }

    @Override
    public GoodsDto toDto() {
        return GoodsConvert.CONVERT.convert(this);
    }
}

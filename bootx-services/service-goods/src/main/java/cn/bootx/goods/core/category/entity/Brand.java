package cn.bootx.goods.core.category.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.goods.core.category.convert.BrandConvert;
import cn.bootx.goods.dto.brand.BrandDto;
import cn.bootx.goods.param.category.BrandParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 品牌
* @author xxm
* @date 2022-05-09
*/
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("gc_brand")
@Accessors(chain = true)
public class Brand extends MpBaseEntity implements EntityBaseFunction<BrandDto>{

    /** 品牌名称 */
    private String name;
    /** 品牌图标 */
    private String logo;
    /** 状态 */
    private String state;
    /** 描述 */
    private String remark;

    /** 创建对象 */
    public static Brand init(BrandParam in) {
            return BrandConvert.CONVERT.convert(in);
    }

    /** 转换成dto */
    @Override
    public BrandDto toDto() {
        return BrandConvert.CONVERT.convert(this);
    }
}

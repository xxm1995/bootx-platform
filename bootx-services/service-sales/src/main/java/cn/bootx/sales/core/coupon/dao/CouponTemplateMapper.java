package cn.bootx.sales.core.coupon.dao;

import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;
import org.springframework.data.repository.query.Param;

/**   
* 优惠券模板
* @author xxm  
* @date 2021/8/10 
*/
@Mapper
public interface CouponTemplateMapper extends BaseMapper<CouponTemplate> {

    @Update("update sc_coupon_template " +
            "set num = (num-${count}),version = (version + 1) " +
            "where id = #{couponTemplateId} and (num - ${count}) >= 0")
    int reduceCoupons(@Param("couponTemplateId") Long couponTemplateId, @Param("count")int count);
}

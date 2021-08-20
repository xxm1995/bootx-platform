package cn.bootx.sales.core.coupon.dao;


import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**   
* 优惠券策略
* @author xxm  
* @date 2020/10/19 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class CouponTemplateManager extends BaseManager<CouponTemplateMapper,CouponTemplate> {
    private final CouponTemplateMapper couponTemplateMapper;

    /**
     * 减少优惠券个数
     */
    public boolean reduceCoupons(Long couponTemplateId,int num){
        return couponTemplateMapper.reduceCoupons(couponTemplateId,num)>0;
    }
}

package cn.bootx.sales.core.coupon.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.sales.core.coupon.entity.Coupon;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

/**   
* 优惠券
* @author xxm  
* @date 2020/11/2 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class CouponManager extends BaseManager<CouponMapper,Coupon> {

    /**
     * 查询用户的优惠券
     */
    public List<Coupon> findByUser(Long userId){
        return findAllByField(Coupon::getUserId,userId);
    }
     /**
     * 查询用户指定状态的优惠券
     */
    public List<Coupon> findByUserAndStatus(Long userId, int status){
        return lambdaQuery().eq(Coupon::getUserId,userId)
                .eq(Coupon::getStatus,status)
                .list();
    }

    /**
     * 根据优惠券模板查询用户拥有的优惠券
     */
    public List<Coupon> findByUserAndTemplate(Long userId,Long templateId) {
        return lambdaQuery().eq(Coupon::getUserId,userId)
                .eq(Coupon::getTemplateId,templateId)
                .list();
    }
}

package cn.bootx.sales.core.check.handler.coupon;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.CollUtils;
import cn.bootx.common.core.util.LocalDateTimeUtils;
import cn.bootx.sales.code.CouponStatusCode;
import cn.bootx.sales.core.calculate.cache.OrderCache;
import cn.bootx.sales.core.calculate.cache.OrderDetailCache;
import cn.bootx.sales.core.coupon.entity.Coupon;
import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import cn.bootx.sales.param.order.OrderCheckParam;
import cn.bootx.sales.param.order.OrderDetailCheckParam;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 优惠券基础(公共)检查
 * @author xxm
 * @date 2020/12/3
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CouponCheckHandler {

    /**
     * 检查优惠卷基础
     */
    public void checkBase(Coupon coupon, OrderCache orderDto) {
        // 状态是否可用
        if (!Objects.equals(coupon.getStatus(), CouponStatusCode.STATUS_NORMAL)) {
            throw new BizException("状态不可用");
        }

        // 用户是否符合
        if (!Objects.equals(orderDto.getUserId(), coupon.getUserId())) {
            throw new BizException("用户不合法");
        }

        // 是否在可用的时间段
        if (!LocalDateTimeUtils.between(LocalDateTime.now(), coupon.getStartTime(), coupon.getEndTime())) {
            throw new BizException("优惠券时间不符合");
        }

    }

    /**
     * 优惠券是否可用
     */
    public boolean canUseCoupon(Coupon coupon) {
        if (!LocalDateTimeUtils.between(LocalDateTime.now(), coupon.getStartTime(), coupon.getEndTime())) {
            return false;
        }
        if (!Objects.equals(coupon.getStatus(), CouponStatusCode.STATUS_NORMAL)) {
            return false;
        }
        return true;
    }


    /**
     * 优惠券互斥检查 true通过/false不通过
     */
    public boolean couponMutual(CouponTemplate couponTemplate, OrderCache orderDto) {
        List<Long> ids = orderDto.getCoupons().stream()
                .map(Coupon::getTemplateId)
                .collect(Collectors.toList());

        return this.checkMutual(couponTemplate.getCouponMutual(),ids);
    }

    /**
     * 活动互斥检查 true通过/false不通过
     */
    public boolean activityMutual(CouponTemplate couponTemplate, OrderCheckParam orderParam) {
        List<Long> registerIds = orderParam.getDetails()
                .stream()
                .map(OrderDetailCheckParam::getActivityIds)
                .flatMap(Collection::stream)
                .collect(Collectors.toList());
       return this.checkMutual(couponTemplate.getActivityMutual(),registerIds);
    }

    /**
     * 活动互斥检查 true通过/false不通过
     */
    public boolean activityMutual(CouponTemplate couponTemplate, OrderCache orderDto) {
        List<Long> registerIds = orderDto.getDetails()
                .stream()
                .map(OrderDetailCache::getActivityIds)
                .flatMap(Collection::stream)
                .collect(Collectors.toList());
        return this.checkMutual(couponTemplate.getActivityMutual(),registerIds);
    }

    /**
     * 互斥检查 true通过/false不通过
     * @param contrastIds 要比对的ids(优惠券/策略注册)
     */
    public boolean checkMutual(String mutual1,List<Long> contrastIds){
        // 无互斥
        if (StrUtil.isBlank(mutual1)){
            return true;
        }
        List<Long> mutual1Ids = StrUtil.split(mutual1,',').stream()
                .map(Long::parseLong)
                .collect(Collectors.toList());
        // 有互斥返回false
        return !CollUtils.contains(contrastIds, mutual1Ids);
    }
}

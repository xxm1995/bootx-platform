package cn.bootx.sales.core.coupon.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.ResultConvertUtils;
import cn.bootx.sales.code.CheckRuleCode;
import cn.bootx.sales.code.CouponStatusCode;
import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import cn.bootx.sales.core.check.injector.CheckRuleInjector;
import cn.bootx.sales.core.check.rule.CheckRuleHandlerAdapter;
import cn.bootx.sales.core.coupon.dao.CouponManager;
import cn.bootx.sales.core.coupon.dao.CouponTemplateManager;
import cn.bootx.sales.core.coupon.entity.Coupon;
import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import cn.bootx.sales.dto.check.CheckRuleResult;
import cn.bootx.sales.dto.coupon.CouponDto;
import cn.bootx.sales.dto.coupon.CouponTemplateDto;
import cn.bootx.sales.param.coupon.ObtainCouponParam;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 优惠券
 * @author xxm
 * @date 2020/10/19
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CouponService {
    private final CheckRuleInjector checkRuleInjector;
    private final CheckRuleHandlerAdapter checkRuleHandlerAdapter;

    private final CouponTemplateManager couponTemplateManager;
    private final CouponManager couponManager;

    /**
     * 领取优惠券
     */
    @Transactional(rollbackFor = Exception.class)
    public void obtainCoupon(ObtainCouponParam param){
        CouponTemplate couponTemplate = couponTemplateManager.findById(param.getTemplateId()).orElseThrow(() -> new BizException("优惠券模板不存在"));

        Integer couponCount = couponTemplate.getNum();
        if (couponCount==0){
            throw new BizException("优惠券已发放完毕");
        }

        // 领取检查
        this.obtainCheck(couponTemplate,param);

        // 扣减优惠券数量
        couponTemplateManager.reduceCoupons(couponTemplate.getId(),1);

        // 设置优惠券时间可用范围
        Integer effectiveType = couponTemplate.getEffectiveType();
        LocalDateTime startTime = null;
        LocalDateTime endTime = null;

        // 固定时间段
        if (Objects.equals(effectiveType, CouponTemplateDto.FIXED_TIME)){
            startTime = couponTemplate.getStartTime();
            endTime = couponTemplate.getEndTime();
        }

        // 生成优惠券
        Coupon coupon = new Coupon()
                .setName(couponTemplate.getName())
                .setTemplateId(couponTemplate.getId())
                .setStatus(CouponStatusCode.STATUS_NORMAL)
                .setStrategyRegisterId(couponTemplate.getStrategyRegisterId())
                .setStartTime(startTime)
                .setEndTime(endTime)
                .setObtainTime(LocalDateTime.now())
                .setUserId(param.getUserId());
        couponManager.save(coupon);
    }

    /**
     * 优惠券领取检查(根据设置的Rule)
     */
    public void obtainCheck(CouponTemplate template,ObtainCouponParam param){
        // 获取领取检查规则
        checkRuleInjector.injectionTemplate(Collections.singletonList(template), CheckRuleCode.RULE_TYPE_COUPON_OBTAIN);
        List<CheckRuleConfig> useCheckRules = template.getCheckRules();
        if (CollUtil.isEmpty(useCheckRules)){
            return;
        }
        for (CheckRuleConfig checkRule : useCheckRules) {
            // 进行检查
            CheckRuleResult checkRuleResult = checkRuleHandlerAdapter.couponObtainCheck(checkRule, template, param);
            if (!checkRuleResult.isPass()){
                throw new BizException(checkRuleResult.getMsg());
            }
        }
    }

    /**
     * 个人的优惠券
     */
    public List<CouponDto> findCouponByUserId(Long userId){
        return couponManager.findByUser(userId)
                .stream()
                .map(Coupon::toDto)
                .collect(Collectors.toList());
    }

    /**
     * 查询
     */
    public CouponDto getById(Long couponId){
        return couponManager.findById(couponId).map(Coupon::toDto)
                .orElse(null);
    }

    /**
     * 查询批量
     */
    public List<CouponDto> findByIds(List<Long> couponIds){
        return ResultConvertUtils.dtoListConvert(couponManager.findAllByIds(couponIds));
    }

    /**
     * 撤销优惠券
     */
    public void revokeById(Long couponId){

    }

    /**
     * 取消锁定
     */
    public void unlockByIds(List<Long> couponIds){
        List<Coupon> coupons = couponManager.findAllByIds(couponIds);
        coupons.forEach(coupon -> coupon.setStatus(CouponStatusCode.STATUS_NORMAL));
        couponManager.updateAllById(coupons);
    }

    /**
     * 锁定优惠券
     */
    public void lockByIds(List<Long> couponIds) {
        List<Coupon> coupons = couponManager.findAllByIds(couponIds);
        coupons.forEach(coupon -> coupon.setStatus(CouponStatusCode.STATUS_FREEZE));
        couponManager.updateAllById(coupons);
    }

    /**
     * 锁定优惠券
     */
    public void lockById(Long couponId) {
        Coupon coupon = couponManager.findById(couponId)
                .map(couponObj -> couponObj.setStatus(CouponStatusCode.STATUS_FREEZE))
                .orElseThrow(() -> new BizException("优惠券不存在"));
        couponManager.updateById(coupon);
    }

    /**
     * 使用优惠券
     */
    public void use(Long couponId,Long orderId){
        Coupon coupon = couponManager.findById(couponId)
                .map(couponObj -> couponObj.setStatus(CouponStatusCode.STATUS_USED)
                        .setOrderId(orderId)
                        .setUsedTime(LocalDateTime.now()))
                .orElseThrow(() -> new BizException("优惠券不存在"));
        couponManager.updateById(coupon);
    }

    /**
     * 批量使用优惠券
     */
    public void useBatch(List<Long> couponIds,Long orderId){
        List<Coupon> coupons = couponManager.findAllByIds(couponIds);
        coupons.forEach(coupon -> coupon.setStatus(CouponStatusCode.STATUS_USED)
                .setOrderId(orderId)
                .setUsedTime(LocalDateTime.now()));
        couponManager.updateAllById(coupons);
    }

}

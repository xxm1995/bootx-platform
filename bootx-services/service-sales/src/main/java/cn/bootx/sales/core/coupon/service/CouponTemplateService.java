package cn.bootx.sales.core.coupon.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.sales.code.CheckRuleCode;
import cn.bootx.sales.code.StrategyRegisterCode;
import cn.bootx.sales.core.coupon.dao.CouponTemplateManager;
import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import cn.bootx.sales.core.match.dao.MatchRuleManager;
import cn.bootx.sales.core.match.entity.MatchRuleConfig;
import cn.bootx.sales.core.strategy.dao.StrategyRegisterManager;
import cn.bootx.sales.core.strategy.entity.StrategyRegister;
import cn.bootx.sales.core.strategy.service.StrategyRegisterService;
import cn.bootx.sales.dto.coupon.CouponTemplateDto;
import cn.bootx.sales.dto.strategy.StrategyRegisterDto;
import cn.bootx.sales.param.coupon.CouponTemplateParam;
import cn.bootx.sales.param.strategy.CheckRuleParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * 优惠券模板
 * @author xxm
 * @date 2020/10/19
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CouponTemplateService {

    private final CouponTemplateManager couponTemplateManager;
    private final StrategyRegisterManager strategyRegisterManager;
    private final MatchRuleManager matchManager;

    private final StrategyRegisterService strategyRegisterService;

    /**
     * 新建优惠券模板
     */
    @Transactional(rollbackFor = Exception.class)
    public CouponTemplateDto add(CouponTemplateParam param){

        // 设置优惠券的策略注册属性
        param.setStrategyType(StrategyRegisterCode.STRATEGY_TYPE_COUPON);

        // 选择和运算检查配置
        List<CheckRuleParam> checkRules = param.getCheckRules();
        checkRules.forEach(checkRuleParam -> checkRuleParam.setRuleType(CheckRuleCode.RULE_TYPE_COUPON_CHECK));
        // 领取检查配置
        List<CheckRuleParam> obtainRules = param.getObtainRules();
        obtainRules.forEach(checkRuleParam -> checkRuleParam.setRuleType(CheckRuleCode.RULE_TYPE_COUPON_OBTAIN));

        List<CheckRuleParam> allCheckRules = new ArrayList<>(checkRules);
        allCheckRules.addAll(obtainRules);
        param.setCheckRules(allCheckRules);

        // 保存策略注册
        StrategyRegisterDto strategyRegisterDto = strategyRegisterService.add(param);

        // 保存模板优惠卷模板
        CouponTemplate couponTemplate = CouponTemplate.init(param);

        // 策略互斥
        String activityMutual = String.join(",", Optional.ofNullable(param.getActivityMutual()).orElse(Collections.emptyList()));
        // 优惠券互斥
        String couponMutual = String.join(",", Optional.ofNullable(param.getCouponMutual()).orElse(Collections.emptyList()));

        couponTemplate.setActivityMutual(activityMutual)
                .setCouponMutual(couponMutual)
                .setStrategyRegisterId(strategyRegisterDto.getId());

        return couponTemplateManager.save(couponTemplate).toDto();
    }


    /**
     * 查询优惠券模板
     */
    public List<CouponTemplateDto> findAll(){
        return couponTemplateManager.findAll()
                .stream()
                .map(CouponTemplate::toDto)
                .collect(Collectors.toList());
    }

    /**
     * 优惠券模板详情
     */
    public CouponTemplateDto findById(Long templateId){
        CouponTemplate couponTemplate = couponTemplateManager.findById(templateId).orElseThrow(() -> new BizException("优惠券模板不存在"));
        CouponTemplateDto couponTemplateDto = couponTemplate.toDto();
        // 策略参数
        StrategyRegister strategyRegister = strategyRegisterManager.findById(couponTemplate.getStrategyRegisterId()).orElseThrow(() -> new BizException("策略注册存在"));
        // 匹配规则
        List<MatchRuleConfig> checkMatches = matchManager.findByStrategyRegisterId(couponTemplate.getStrategyRegisterId());

        return couponTemplateDto.setStrategyRegister(strategyRegister.toDto());
//                .setMatchIds(checkMatches.stream().map(MatchRuleConfig::getFeaturePoint).collect(Collectors.toList()));
    }
}

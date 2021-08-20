package cn.bootx.sales.core.calculate.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.BigDecimalUtil;
import cn.bootx.sales.core.calculate.cache.CalculateCache;
import cn.bootx.sales.core.calculate.cache.OrderCache;
import cn.bootx.sales.core.calculate.cache.OrderDetailCache;
import cn.bootx.sales.core.calculate.handler.CalculateHandlerAdapter;
import cn.bootx.sales.core.coupon.entity.Coupon;
import cn.bootx.sales.core.strategy.entity.Strategy;
import cn.bootx.sales.core.strategy.entity.StrategyConfigValue;
import cn.bootx.sales.core.strategy.entity.StrategyRegister;
import cn.bootx.sales.dto.order.OrderStrategyMappingResult;
import cn.bootx.sales.dto.strategy.StrategyRegisterDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 计算服务，提供更细化的计算功能供其他模块调用
 * @author xxm
 * @date 2020/10/15
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CalculateService {
    private final CalculateHandlerAdapter calculateHandlerAdapter;

    /**
     * 计算选定的活动策略
     * @param strategyRegister 策略
     * @param list 订单明细列表
     * @param calculateCache 缓存
     */
    public void calculateChoose(StrategyRegister strategyRegister, List<OrderDetailCache> list, CalculateCache calculateCache){
        if (Objects.isNull(strategyRegister)){
            throw new BizException("策略注册为空");
        }
        // 求符合条件明细的总价
        BigDecimal originalValue = list.stream()
                .map(detail -> BigDecimalUtil.multiply(detail.getGoodsPrice(), BigDecimal.valueOf(detail.getNum())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        Map<Long, Strategy> strategyMap = calculateCache.getStrategyMap();
        Strategy strategy = strategyMap.get(strategyRegister.getStrategyId());

        //获取订单类型的策略的执行参数
        Map<Long, List<StrategyConfigValue>> strategyConfigValueMap = calculateCache.getStrategyConfigValueMap();
        List<StrategyConfigValue> configValues =
                Optional.ofNullable(strategyConfigValueMap.get(strategyRegister.getId()))
                        .orElseThrow(() -> new BizException("策略参数未找到"));

        log.info("明细策略: {}，原价: {}", strategy.getName(), originalValue);

        // 执行脚本计算价格
        BigDecimal amountChange = calculateHandlerAdapter
                .calculateByScript(originalValue,list,strategy,configValues,calculateCache);

        log.info("明细策略: {}，优惠价: {}",strategy.getName(), amountChange);

        // 分摊
        this.shareAmount(amountChange,list,null, strategyRegister);
    }

    /**
     * 优惠券计算
     */
    public void calculateCoupon(StrategyRegister strategyRegister, List<OrderDetailCache> list, Coupon coupon, OrderCache orderCache, CalculateCache calculateCache) {
        // 求符合条件明细的总价
        BigDecimal originalValue = list.stream()
                .map(detail -> BigDecimalUtil.multiply(detail.getGoodsPrice(), BigDecimal.valueOf(detail.getNum())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        Map<Long, Strategy> strategyMap = calculateCache.getStrategyMap();
        Strategy strategy = strategyMap.get(strategyRegister.getStrategyId());

        //获取订单类型的策略的执行参数
        Map<Long, List<StrategyConfigValue>> strategyConfigValueMap = calculateCache.getStrategyConfigValueMap();
        List<StrategyConfigValue> orderTypeStrategyConfigValues =
                Optional.ofNullable(strategyConfigValueMap.get(strategyRegister.getId()))
                        .orElseThrow(() -> new BizException("策略参数未找到"));

        log.info("明细策略: {}，原价: {}", strategy.getName(), originalValue);

        //执行脚本计算价格
        BigDecimal amountChange = calculateHandlerAdapter
                .calculateByScript(originalValue, list, strategy, orderTypeStrategyConfigValues, calculateCache);

        log.info("明细策略: {}，优惠价: {}", strategy.getName(), amountChange);

        // 分摊
        this.shareAmount(amountChange,list,coupon.getId(),strategyRegister);
    }


    /**
     * 优惠后订单明细金额分摊
     */
    private void shareAmount(BigDecimal amountChange, List<OrderDetailCache> list, Long couponId, StrategyRegister strategyRegister){

        // 需要进行分摊的总价
        BigDecimal shareValue = list.stream()
                .filter(detail -> Objects.equals(detail.getIsShare(), true))
                .map(detail -> BigDecimalUtil.multiply(detail.getGoodsPrice(), BigDecimal.valueOf(detail.getNum())))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        // 已经分摊金额
        BigDecimal alreadyShareValue = BigDecimal.ZERO;
        // 价格分摊  如果价格已变即策略已执行生效
        if (amountChange.compareTo(BigDecimal.ZERO) != 0) {

            // 可分摊明细(从小到大进行排序)
            List<OrderDetailCache> shareList = list.stream()
                    .filter(detail -> Objects.equals(detail.getIsShare(), true))
                    .sorted((o1, o2) -> BigDecimalUtil.compareTo(o1.getTotalAmount(), o2.getTotalAmount()))
                    .collect(Collectors.toList());
            // 可分摊总额
            BigDecimal shareTotal = shareList.stream()
                    .map(OrderDetailCache::getTotalAmount)
                    .reduce(BigDecimal.ZERO, BigDecimal::add);

            // 优惠金额超过分摊总价,
            if (BigDecimalUtil.compareTo(amountChange, shareTotal) == 1) {
                amountChange = shareTotal;
            }

            //计算 分摊至订单细节的金额 先分摊N-1个, 剩下的分摊到最后一个
            for (int i = 0; i < shareList.size(); i++) {
                OrderDetailCache detail = shareList.get(i);
                // 价格变动值
                BigDecimal priceChange;
                // 最后一个订单分摊剩余的
                if (shareList.size() - 1 == i) {
                    priceChange = BigDecimalUtil.subtract(amountChange, alreadyShareValue);
                } else {
                    // 计算所占需分摊比率
                    BigDecimal proportion = BigDecimalUtil.divide(detail.getTotalAmount(), shareValue);
                    priceChange = BigDecimalUtil.multiply(amountChange, proportion);
                    // 分摊金额超过明细金额, 分摊金额作为价格变动值
                    if (BigDecimalUtil.compareTo(priceChange,detail.getTotalAmount()) == 1){
                        priceChange = detail.getTotalAmount();
                    }
                    // 累加到已分摊金额上
                    alreadyShareValue = BigDecimalUtil.add(alreadyShareValue, priceChange);
                }

                // 记录到订单明细中的价格变动记录中
                OrderStrategyMappingResult orderStrategyMapping = new OrderStrategyMappingResult()
                        .setStrategyRegisterId(strategyRegister.getId())
                        .setStrategyId(strategyRegister.getStrategyId())
                        .setStrategyType(strategyRegister.getStrategyType())
                        .setCouponId(couponId)
                        .setPriceChange(priceChange)
                        .setDescription("优惠策略 : " + strategyRegister.getName());
                detail.getMappings().add(orderStrategyMapping);
            }
        }
    }

    /**
     * 计算单个明细的价格
     */
    public BigDecimal calculateSingle(StrategyRegisterDto registerDto, OrderDetailCache detail, CalculateCache calculateCache){
        Map<Long, StrategyRegister> strategyRegisterMap = calculateCache.getStrategyRegisterMap();
        StrategyRegister strategyRegister = Optional.ofNullable(strategyRegisterMap.get(registerDto.getId()))
                .orElseThrow(() -> new BizException("策略注册未找到"));

        // 求符合条件明细的总价
        BigDecimal originalValue = detail.getGoodsPrice().multiply(new BigDecimal(detail.getNum()));

        Map<Long, Strategy> strategyMap = calculateCache.getStrategyMap();
        Strategy strategy = Optional.ofNullable(strategyMap.get(strategyRegister.getStrategyId()))
                .orElseThrow(() -> new BizException("策略未找到"));

        //获取订单类型的策略的执行参数
        Map<Long, List<StrategyConfigValue>> strategyConfigValueMap = calculateCache.getStrategyConfigValueMap();
        List<StrategyConfigValue> configValues =
                Optional.ofNullable(strategyConfigValueMap.get(strategyRegister.getId()))
                        .orElseThrow(() -> new BizException("策略参数未找到"));

        log.info("明细策略: {}，原价: {}", strategy.getName() , originalValue);

        //执行脚本计算价格
        BigDecimal amountChange = calculateHandlerAdapter
                .calculateByScript(originalValue, Collections.singletonList(detail),strategy,configValues,calculateCache);

        log.info("明细策略: {}，优惠价: {}",strategy.getName(), amountChange);
        return amountChange;
    }

    /**
     * 计算明细价格
     */
    public void calculateAmountByDetail(List<OrderDetailCache> details){
        for (OrderDetailCache detail : details) {
            BigDecimal priceChange = detail.getMappings()
                    .stream()
                    .map(OrderStrategyMappingResult::getPriceChange)
                    .reduce(BigDecimal.ZERO, BigDecimal::add);
            BigDecimal totalAmount = detail.getTotalAmount();
            if (BigDecimalUtil.compareTo(totalAmount,priceChange) == 1){
                detail.setPayAmount(BigDecimalUtil.subtract(totalAmount,priceChange));
                detail.setPayChange(priceChange);
            } else {
                // 这样子是优惠额度超出了应付金额,产生了负数
                detail.setPayAmount(BigDecimalUtil.getZero());
                detail.setPayChange(totalAmount);
            }
        }
    }
}

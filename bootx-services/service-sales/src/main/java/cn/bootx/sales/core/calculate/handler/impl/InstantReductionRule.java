package cn.bootx.sales.core.calculate.handler.impl;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.sales.core.calculate.cache.CalculateCache;
import cn.bootx.sales.core.calculate.cache.OrderDetailCache;
import cn.bootx.sales.core.calculate.code.JavaCalculateCode;
import cn.bootx.sales.core.calculate.handler.func.JavaCalculateHandler;
import cn.bootx.sales.core.strategy.entity.StrategyConfigValue;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;
import java.util.Objects;

/**
 * 立减优惠
 * @author xxm
 * @date 2021/4/14
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class InstantReductionRule implements JavaCalculateHandler {
    @Override
    public String getCode() {
        return JavaCalculateCode.INSTANT_REDUCTION;
    }

    /**
     * 计算接口
     * @param originalValue 要进行计算的价格 原价
     * @param details 要计算的明细
     * @param configValues 策略参数
     * @param calculateCache 缓存
     * @return 计算后的价格
     */
    @Override
    public BigDecimal calculate(BigDecimal originalValue, List<OrderDetailCache> details, List<StrategyConfigValue> configValues, CalculateCache calculateCache) {
        String field = JavaCalculateCode.InstantReduction.AMOUNT.getKey();
        StrategyConfigValue configValue = configValues.stream()
                .filter(value -> Objects.equals(field, value.getKey()))
                .findFirst()
                .orElseThrow(() -> new BizException("配置计算参数有误"));

        String value = configValue.getValue();

        return new BigDecimal(value);
    }
}

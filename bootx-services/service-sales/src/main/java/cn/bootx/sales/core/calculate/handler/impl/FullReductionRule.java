package cn.bootx.sales.core.calculate.handler.impl;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.BigDecimalUtil;
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
* 满减优惠
* @author xxm  
* @date 2021/4/14 
*/
@Slf4j
@Component
@RequiredArgsConstructor
public class FullReductionRule implements JavaCalculateHandler {
    @Override
    public String getCode() {
        return JavaCalculateCode.FULL_REDUCTION;
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

        StrategyConfigValue satisfy = getFiled(JavaCalculateCode.FullReduction.SATISFY.getKey(), configValues);
        StrategyConfigValue minus = getFiled(JavaCalculateCode.FullReduction.MINUS.getKey(), configValues);

        if (BigDecimalUtil.compareTo(originalValue,new BigDecimal(satisfy.getValue())) > 0){
            return new BigDecimal(minus.getValue());
        } else {
            return BigDecimal.ZERO;
        }
    }

    public StrategyConfigValue getFiled(String key,List<StrategyConfigValue> configValues){
        return configValues.stream()
                .filter(value -> Objects.equals(key, value.getKey()))
                .findFirst()
                .orElseThrow(() -> new BizException("配置计算参数有误"));
    }
}

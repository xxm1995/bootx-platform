package cn.bootx.sales.core.calculate.handler.func;

import cn.bootx.sales.core.calculate.cache.CalculateCache;
import cn.bootx.sales.core.calculate.cache.OrderDetailCache;
import cn.bootx.sales.core.strategy.entity.StrategyConfigValue;

import java.math.BigDecimal;
import java.util.List;

/**
 * java策略计算服务接口
 * @author xxm
 * @date 2020/12/13
 */
public interface JavaCalculateHandler {

    /** 唯一code标示 */
    String getCode();

    /**
     * 计算接口
     * @param originalValue 要进行计算的价格 原价
     * @param details 要计算的明细
     * @param configValues 策略参数
     * @param calculateCache 缓存
     * @return 计算后的价格
     */
    BigDecimal calculate(BigDecimal originalValue, List<OrderDetailCache> details, List<StrategyConfigValue> configValues, CalculateCache calculateCache);
}

package cn.bootx.sales.exception.strategy;


import cn.bootx.common.core.exception.BizException;
import cn.bootx.sales.code.SalesCenterErrorCode;

/**
 * 策略计算异常
 * @author xxm
 * @date 2020/10/15
 */
public class StrategyCalculateException extends BizException {
    public StrategyCalculateException() {
        super(SalesCenterErrorCode.STRATEGY_CALCULATE_ERROR, "策略计算异常");
    }
}

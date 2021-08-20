package cn.bootx.sales.exception.strategy;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.sales.code.SalesCenterErrorCode;


public class StrategyAlreadyUsedException extends BizException {
    public StrategyAlreadyUsedException() {
        super(SalesCenterErrorCode.STRATEGY_ALREADY_USED, "已经使用的策略");
    }
}

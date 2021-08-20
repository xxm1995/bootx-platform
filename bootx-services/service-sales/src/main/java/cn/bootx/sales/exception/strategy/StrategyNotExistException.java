package cn.bootx.sales.exception.strategy;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.sales.code.SalesCenterErrorCode;

/**
 *
 * @author zhangguoquan
 * @date 18/4/8
 */
public class StrategyNotExistException extends BizException {
    public StrategyNotExistException() {
        super(SalesCenterErrorCode.STRATEGY_NOT_EXIST, "策略不存在");
    }
}

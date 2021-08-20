package cn.bootx.sales.core.calculate.handler;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.sales.code.StrategyCode;
import cn.bootx.sales.core.calculate.cache.CalculateCache;
import cn.bootx.sales.core.calculate.cache.OrderDetailCache;
import cn.bootx.sales.core.calculate.handler.func.JavaCalculateHandler;
import cn.bootx.sales.core.strategy.entity.Strategy;
import cn.bootx.sales.core.strategy.entity.StrategyConfigValue;
import cn.bootx.sales.engine.groovy.GroovyHandler;
import cn.bootx.sales.engine.java.JavaCalculateHandlerFactory;
import cn.bootx.sales.engine.javascript.JavaScriptHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;

/**   
* 计算脚本适配器(动态分发到java/JavaScript/groovy处理器中)
* @author xxm  
* @date 2020/12/13 
*/
@Component
@RequiredArgsConstructor
public class CalculateHandlerAdapter {
    private final JavaCalculateHandlerFactory javaCalculateHandlerFactory;

    /**
     * 计算适配器
     * @param originalValue 要进行计算的价格
     * @param details 要计算的明细
     * @param strategy 策略
     * @param configValues 策略参数
     * @param calculateCache 缓存
     * @return 计算后的价格
     */
    public BigDecimal calculateByScript(BigDecimal originalValue, List<OrderDetailCache> details, Strategy strategy, List<StrategyConfigValue> configValues, CalculateCache calculateCache){
        int type = strategy.getEngineType();

        switch (type){
            case StrategyCode.ENGINE_SYSTEM: {
                JavaCalculateHandler calculateHandler = javaCalculateHandlerFactory.getCalculateHandler(strategy.getCode());
                return calculateHandler.calculate(originalValue,details,configValues,calculateCache);
            }
            case StrategyCode.ENGINE_JAVASCRIPT: {
                return JavaScriptHandler.calculateByScript(originalValue,strategy.getRuleScript(),configValues);
            }
            case StrategyCode.ENGINE_GROOVY: {
                return GroovyHandler.checkByScript(originalValue,details,strategy.getRuleScript(),configValues,calculateCache);
            }
            default:
                throw new BizException("不支持的类型");
        }
    }
}

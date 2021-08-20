package cn.bootx.sales.engine.javascript;

import cn.bootx.sales.core.strategy.entity.StrategyConfigValue;
import cn.bootx.sales.exception.strategy.StrategyCalculateException;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.crypto.digest.MD5;
import lombok.extern.slf4j.Slf4j;

import javax.script.*;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import static cn.bootx.common.core.util.BigDecimalUtil.CURRENCY_DECIMAL_PLACES;


/**
* js策略运行器
* @author xxm
* @date 2020/10/17
*/
@Slf4j
public class JavaScriptHandler {

    private static final String JAVASCRIPT = "javascript";
    private static final String ORIGIN_VALUE = "originValue";

    private static final Map<String,CompiledScript> MAP = new HashMap<>();
    private static final ScriptEngine ENGINE =  new ScriptEngineManager().getEngineByName(JAVASCRIPT);

    private JavaScriptHandler() {
    }

    /**
     * 价格计算
     * @param originalValue 价格
     * @param script 脚本
     * @param configValues 配置项
     */
    public static BigDecimal calculateByScript(BigDecimal originalValue, String script, List<StrategyConfigValue> configValues){
        try{
            Compilable compilable = (Compilable) ENGINE;
            String key = MD5.create().digestHex16(script);
            CompiledScript jsFunction = MAP.get(key);
            if (Objects.isNull(jsFunction)){
                jsFunction = compilable.compile(script);
                MAP.put(key,jsFunction);
            }

            // 参数构造
            Bindings bindings = ENGINE.createBindings();
            bindings.put(ORIGIN_VALUE, originalValue.doubleValue());
            if (CollUtil.isNotEmpty(configValues)){
                for (StrategyConfigValue configValue: configValues) {
                    bindings.put(configValue.getKey(), configValue.getValue());
                }
            }
            Object eval = jsFunction.eval(bindings);
            return BigDecimal.valueOf(Double.parseDouble(eval.toString()))
                    .setScale(CURRENCY_DECIMAL_PLACES, RoundingMode.HALF_UP);

        }catch (ScriptException e) {
            log.error("订单价格计算运算失败", e);
            throw new StrategyCalculateException();
        }
    }

}

package cn.bootx.sales.engine.groovy;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.calculate.cache.CalculateCache;
import cn.bootx.sales.core.calculate.cache.OrderCache;
import cn.bootx.sales.core.calculate.cache.OrderDetailCache;
import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import cn.bootx.sales.core.strategy.entity.StrategyConfigValue;
import cn.bootx.sales.core.strategy.entity.StrategyRegister;
import cn.bootx.sales.dto.check.CheckRuleResult;
import cn.bootx.sales.exception.strategy.StrategyCalculateException;
import cn.bootx.sales.param.coupon.ObtainCouponParam;
import cn.bootx.sales.param.order.OrderCheckParam;
import cn.bootx.sales.param.order.OrderDetailCheckParam;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.digest.MD5;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;
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
 * Groovy计算处理器
 * @author xxm
 * @date 2020/12/13
 */
@Slf4j
public class GroovyHandler {

    private static final String GROOVY = "groovy";
    private static final String ORIGIN_VALUE = "originValue";
    private static final String DETAILS = "details";
    private static final String CALCULATE_CACHE = "calculateCache";

    private static final Map<String, CompiledScript> MAP = new HashMap<>();
    private static final ScriptEngine ENGINE =  new ScriptEngineManager().getEngineByName(GROOVY);

    /**
     * 价格计算
     * @param originalValue 价格
     * @param details 计算明细
     * @param script 脚本
     * @param configValues 参数
     * @param calculateCache 订单计算缓存
     */
    public static BigDecimal checkByScript(BigDecimal originalValue, List<OrderDetailCache> details, String script,
                                           List<StrategyConfigValue> configValues, CalculateCache calculateCache) {
        try{
            Compilable compilable = (Compilable) ENGINE;
            String key = MD5.create().digestHex16(script);
            CompiledScript groovyFunction = MAP.get(key);
            if (Objects.isNull(groovyFunction)){
                groovyFunction = compilable.compile(script);
                MAP.put(key,groovyFunction);
            }

            // 参数构造
            Bindings bindings = ENGINE.createBindings();
            bindings.put(ORIGIN_VALUE, originalValue.doubleValue());
            bindings.put(DETAILS, details);
            bindings.put(CALCULATE_CACHE, calculateCache);

            if (CollectionUtil.isNotEmpty(configValues)){
                for (StrategyConfigValue configValue: configValues) {
                    bindings.put(configValue.getKey(), configValue.getValue());
                }
            }
            Object eval = groovyFunction.eval(bindings);

            return BigDecimal.valueOf(Double.parseDouble(eval.toString()))
                    .setScale(CURRENCY_DECIMAL_PLACES, RoundingMode.HALF_UP);

        }catch (ScriptException e) {
            log.error("订单价格计算运算失败", e);
            throw new StrategyCalculateException();
        }
    }

    /**
     * 检查策略运算
     * @param checkRule 策略
     * @param checkParam 参数
     */
    public static CheckRuleResult checkByScript(CheckRuleConfig checkRule, CheckParam checkParam) {
        try{
            String script = checkRule.getRuleScript();
            Compilable compilable = (Compilable) ENGINE;
            String key = MD5.create().digestHex16(script);
            CompiledScript groovyFunction = MAP.get(key);
            if (Objects.isNull(groovyFunction)){
                groovyFunction = compilable.compile(script);
                MAP.put(key,groovyFunction);
            }
            // 参数构造
            Bindings bindings = ENGINE.createBindings();
            bindings.put("checkParam", checkParam);
            bindings.put("checkRule", checkRule);

            Object eval = groovyFunction.eval(bindings);
            String result = eval.toString();

            CheckRuleResult checkRuleResult = new CheckRuleResult();
            if (StrUtil.isNotBlank(result)){
                checkRuleResult.setPass(false)
                        .setMsg(result);
            }
            return checkRuleResult;

        }catch (ScriptException e) {
            log.error("自定义策略检查失败", e);
            throw new BizException("自定义策略检查失败");
        }
    }

    /**
     *  参数
     */
    @Getter
    @Setter
    @Accessors(chain = true)
    public static class CheckParam {
        CheckRuleConfig checkRule;
        Activity activity;
        CouponTemplate template;
        StrategyRegister strategyRegister;
        ObtainCouponParam obtainCouponParam;
        OrderCheckParam orderParam;
        OrderDetailCheckParam orderDetailParam;
        OrderCache orderCache;
        OrderDetailCache orderDetailCache;
        CalculateCache calculateCache;
    }
}


package cn.bootx.sales.core.check.rule;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.FatalException;
import cn.bootx.sales.core.check.rule.func.AbstractCheckRule;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
* 检查规则服务适配器工厂
* @author xxm
* @date 2020/12/6
*/
@Component
public class CheckRuleHandlerFactory implements ApplicationContextAware {

    private List<AbstractCheckRule> abstractCheckRules;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        abstractCheckRules = new ArrayList<>(applicationContext.getBeansOfType(AbstractCheckRule.class).values());
        // 检查ruleCode是否有重复
        long count = abstractCheckRules.stream()
                .map(AbstractCheckRule::getCode)
                .distinct()
                .count();
        if (abstractCheckRules.size()!=count){
            throw new FatalException(0,"CheckRule实现类RuleCode有重复");
        }
    }

    /**
     * 根据类型选择出 支持的类
     */
    public <T extends AbstractCheckRule> T getRuleHandler(String ruleCode, Class<T> clazz){
        AbstractCheckRule abstractCheckRule = abstractCheckRules.stream()
                .filter(handler -> Objects.equals(handler.getCode(), ruleCode))
                .findFirst()
                .orElseThrow(() -> new BizException("ruleCode没有对应的处理类"));

        if (clazz.isAssignableFrom(abstractCheckRule.getClass())){
            //noinspection unchecked
            return (T) abstractCheckRule;
        }
        throw new BizException("传入类型错误");
    }
}

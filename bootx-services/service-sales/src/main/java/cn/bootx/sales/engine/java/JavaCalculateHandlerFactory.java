package cn.bootx.sales.engine.java;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.FatalException;
import cn.bootx.sales.core.calculate.handler.func.JavaCalculateHandler;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**   
* 自定义策略计算规则(java接口)
* @author xxm  
* @date 2020/12/13 
*/
@Component
public class JavaCalculateHandlerFactory implements ApplicationContextAware {

    private List<JavaCalculateHandler> javaCalculateHandlers;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        javaCalculateHandlers = new ArrayList<>(applicationContext.getBeansOfType(JavaCalculateHandler.class).values());
        // 检查ruleCode是否有重复
        long count = javaCalculateHandlers.stream()
                .map(JavaCalculateHandler::getCode)
                .distinct()
                .count();
        if (javaCalculateHandlers.size()!=count){
            throw new FatalException(0,"策略计算类实现类Code有重复");
        }
    }

    /**
     * 根据类型选择出 支持的类
     */
    public JavaCalculateHandler getCalculateHandler(String ruleCode){
        return javaCalculateHandlers.stream()
                .filter(handler -> Objects.equals(handler.getCode(), ruleCode))
                .findFirst()
                .orElseThrow(() -> new BizException("Code没有对应的处理类"));
    }
}

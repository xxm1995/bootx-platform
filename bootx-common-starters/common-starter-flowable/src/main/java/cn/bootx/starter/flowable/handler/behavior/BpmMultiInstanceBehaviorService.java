package cn.bootx.starter.flowable.handler.behavior;

import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.bpmn.behavior.MultiInstanceActivityBehavior;

import java.util.List;

/**
 * Bpm 多实例行为服务
 * @author xxm
 * @date 2022/9/4
 */
public interface BpmMultiInstanceBehaviorService {

    /**
     * 计算当前执行任务的处理人id集合
     */
    List<Long> getTaskUsers(DelegateExecution execution, MultiInstanceActivityBehavior multiInstanceActivityBehavior);

    /**
     * 是否满足结束条件
     */
    boolean completionConditionSatisfied(DelegateExecution execution);

}

package cn.bootx.starter.flowable.handler.behavior;

import cn.hutool.core.util.IdUtil;
import org.flowable.bpmn.model.Activity;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.bpmn.behavior.AbstractBpmnActivityBehavior;
import org.flowable.engine.impl.bpmn.behavior.SequentialMultiInstanceBehavior;

import java.util.List;

import static cn.bootx.starter.flowable.code.BpmnCode.*;

/**
 * Bpm 顺序多实例行为
 * @author xxm
 * @date 2022/9/6 
 */
public class BpmSequentialMultiInstanceBehavior extends SequentialMultiInstanceBehavior {
    private final BpmMultiInstanceBehaviorService behaviorService;
    public BpmSequentialMultiInstanceBehavior(Activity activity, AbstractBpmnActivityBehavior innerActivityBehavior, BpmMultiInstanceBehaviorService behaviorService) {
        super(activity, innerActivityBehavior);
        this.behaviorService = behaviorService;
    }

    /**
     * 多实例创建
     */
    @Override
    protected int resolveNrOfInstances(DelegateExecution execution) {
        // 清空collectionExpression , 它和 collectionVariable 是互斥的
        super.setCollectionExpression(null);
        // 设置 collectionElementVariable(迭代出来的处理人) 和 collectionString(候选人集合)
        super.setCollectionString(MULTI_COLLECTION);
        super.setCollectionElementVariable(MULTI_COLLECTION_ELEMENT);

        List<Long> taskUsers = behaviorService.getTaskUsers(execution,this);
        execution.setVariable(super.collectionString, taskUsers);
        execution.setVariable(MULTI_TASK_ID, IdUtil.getSnowflakeNextId());
        return taskUsers.size();
    }

    /**
     * 是否满足结束条件
     */
    @Override
    public boolean completionConditionSatisfied(DelegateExecution execution) {
        // 先进行自定义判断处理, 不通过调用原生的处理
        boolean conditionSatisfied = behaviorService.completionConditionSatisfied(execution, this) || super.completionConditionSatisfied(execution);
        if (conditionSatisfied){
            // 删除多实例id
            execution.removeVariable(MULTI_TASK_ID);
        }
        return conditionSatisfied;
    }
}

package cn.bootx.starter.flowable.handler.behavior;

import cn.bootx.starter.flowable.local.BpmContext;
import cn.bootx.starter.flowable.local.BpmContextLocal;
import cn.hutool.core.util.IdUtil;
import org.flowable.bpmn.model.Activity;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.bpmn.behavior.AbstractBpmnActivityBehavior;
import org.flowable.engine.impl.bpmn.behavior.ParallelMultiInstanceBehavior;

import java.util.List;

import static cn.bootx.starter.flowable.code.BpmnCode.*;

/**
 * Bpm 并行多实例行为
 *
 * @author xxm
 * @date 2022/8/28
 */
public class BpmParallelMultiInstanceBehavior extends ParallelMultiInstanceBehavior {

    private final BpmMultiInstanceBehaviorService behaviorService;

    public BpmParallelMultiInstanceBehavior(Activity activity, AbstractBpmnActivityBehavior originalActivityBehavior,
            BpmMultiInstanceBehaviorService bpmMultiInstanceBehaviorService) {
        super(activity, originalActivityBehavior);
        this.behaviorService = bpmMultiInstanceBehaviorService;
    }

    /**
     * 忽略原有的 collectionString、collectionElementVariable 表达式，而是采用自己定义的 获得任务的处理人，并设置到
     * collectionVariable 中，用于 BpmUserTaskActivityBehavior 从中可以获取任务的处理人
     * 多个任务实例，每个任务实例对应一个处理人，所以返回的数量就是任务处理人的数量
     */
    @Override
    protected int resolveNrOfInstances(DelegateExecution execution) {
        // 清空collectionExpression , 它和 collectionVariable 是互斥的
        super.setCollectionExpression(null);
        // 设置 collectionElementVariable(迭代出来的处理人) 和 collectionString(候选人集合)
        super.setCollectionString(MULTI_COLLECTION);
        super.setCollectionElementVariable(MULTI_COLLECTION_ELEMENT);

        List<String> taskUsers = behaviorService.getTaskUsers(execution, this);
        BpmContext bpmContext = BpmContextLocal.get();
        bpmContext.setTaskMultiId(IdUtil.getSnowflakeNextId());
        BpmContextLocal.put(bpmContext);
        execution.setVariable(super.collectionString, taskUsers);
        return taskUsers.size();
    }

    /**
     * 是否满足结束条件
     */
    @Override
    public boolean completionConditionSatisfied(DelegateExecution execution) {
        // 先进行自定义判断处理, 不通过调用原生的处理
        boolean conditionSatisfied = behaviorService.completionConditionSatisfied(execution, this)
                || super.completionConditionSatisfied(execution);
        if (conditionSatisfied) {
            // 删除多实例id
            execution.removeVariable(MULTI_TASK_ID);
        }
        return conditionSatisfied;
    }

}

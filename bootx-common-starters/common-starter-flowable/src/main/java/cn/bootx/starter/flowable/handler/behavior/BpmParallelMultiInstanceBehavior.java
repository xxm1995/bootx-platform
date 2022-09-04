package cn.bootx.starter.flowable.handler.behavior;

import cn.bootx.starter.flowable.util.FlowableUtil;
import org.flowable.bpmn.model.Activity;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.bpmn.behavior.AbstractBpmnActivityBehavior;
import org.flowable.engine.impl.bpmn.behavior.ParallelMultiInstanceBehavior;

import java.util.List;

/**
 *
 * @author xxm
 * @date 2022/8/28
 */
public class BpmParallelMultiInstanceBehavior extends ParallelMultiInstanceBehavior {
    private final BpmParallelMultiInstanceAssignService assistService;
    public BpmParallelMultiInstanceBehavior(Activity activity, AbstractBpmnActivityBehavior originalActivityBehavior, BpmParallelMultiInstanceAssignService bpmParallelMultiInstanceAssignService) {
        super(activity, originalActivityBehavior);
        this.assistService = bpmParallelMultiInstanceAssignService;
    }

    /**
     * 忽略原有的 collectionString、collectionElementVariable 表达式，而是采用自己定义的
     * 获得任务的处理人，并设置到 collectionVariable 中，用于 BpmUserTaskActivityBehavior 从中可以获取任务的处理人
     * 多个任务实例，每个任务实例对应一个处理人，所以返回的数量就是任务处理人的数量
     */
    @Override
    protected int resolveNrOfInstances(DelegateExecution execution) {
        // 清空collectionExpression , 它和 collectionVariable 是互斥的
        super.collectionExpression = null;
        // 设置 collectionElementVariable(迭代出来的处理人) 和 collectionString(候选人集合)
        super.collectionString = FlowableUtil.formatCollectionVariable(execution.getCurrentActivityId());
        super.collectionElementVariable = FlowableUtil.formatCollectionElementVariable(execution.getCurrentActivityId());

        List<Long> taskUsers = assistService.getTaskUsers(execution,this);
        execution.setVariable(super.collectionString, taskUsers);
        return taskUsers.size();
    }
}

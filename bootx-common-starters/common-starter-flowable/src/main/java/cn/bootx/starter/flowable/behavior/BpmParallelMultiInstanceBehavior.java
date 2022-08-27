package cn.bootx.starter.flowable.behavior;

import org.flowable.bpmn.model.Activity;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.bpmn.behavior.AbstractBpmnActivityBehavior;
import org.flowable.engine.impl.bpmn.behavior.ParallelMultiInstanceBehavior;

/**
 *
 * @author xxm
 * @date 2022/8/28
 */
public class BpmParallelMultiInstanceBehavior extends ParallelMultiInstanceBehavior {
    public BpmParallelMultiInstanceBehavior(Activity activity, AbstractBpmnActivityBehavior originalActivityBehavior) {
        super(activity, originalActivityBehavior);

    }

    /**
     *
     * @param execution
     * @return
     */
    @Override
    protected int resolveNrOfInstances(DelegateExecution execution) {

        return 3;
    }
}

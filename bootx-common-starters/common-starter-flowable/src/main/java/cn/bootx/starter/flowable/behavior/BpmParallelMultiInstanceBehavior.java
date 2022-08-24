package cn.bootx.starter.flowable.behavior;

import org.flowable.bpmn.model.Activity;
import org.flowable.engine.impl.bpmn.behavior.AbstractBpmnActivityBehavior;
import org.flowable.engine.impl.bpmn.behavior.ParallelMultiInstanceBehavior;

public class BpmParallelMultiInstanceBehavior extends ParallelMultiInstanceBehavior {
    public BpmParallelMultiInstanceBehavior(Activity activity, AbstractBpmnActivityBehavior originalActivityBehavior) {
        super(activity, originalActivityBehavior);
    }
}

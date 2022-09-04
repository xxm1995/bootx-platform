package cn.bootx.starter.flowable.handler.behavior;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.bpmn.model.Activity;
import org.flowable.bpmn.model.UserTask;
import org.flowable.engine.impl.bpmn.behavior.AbstractBpmnActivityBehavior;
import org.flowable.engine.impl.bpmn.behavior.ParallelMultiInstanceBehavior;
import org.flowable.engine.impl.bpmn.behavior.UserTaskActivityBehavior;
import org.flowable.engine.impl.bpmn.parser.factory.DefaultActivityBehaviorFactory;
import org.springframework.stereotype.Component;

/**
 * Bpm 活动行为工厂
 * @author xxm
 * @date 2022/8/24
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BpmActivityBehaviorFactory extends DefaultActivityBehaviorFactory {
    private final BpmUserTaskAssignService bpmUserTaskAssignService;
    private final BpmParallelMultiInstanceAssignService assistService;

    @Override
    public UserTaskActivityBehavior createUserTaskActivityBehavior(UserTask userTask) {
        return new BpmUserTaskActivityBehavior(userTask, bpmUserTaskAssignService);
    }

    /**
     * 创建并行多实例行为
     */
    @Override
    public ParallelMultiInstanceBehavior createParallelMultiInstanceBehavior(Activity activity,
                                                                             AbstractBpmnActivityBehavior innerActivityBehavior) {
        return new BpmParallelMultiInstanceBehavior(activity, innerActivityBehavior, assistService);
    }
}

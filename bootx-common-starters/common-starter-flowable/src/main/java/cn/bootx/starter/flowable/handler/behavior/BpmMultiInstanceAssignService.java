package cn.bootx.starter.flowable.handler.behavior;

import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.bpmn.behavior.MultiInstanceActivityBehavior;

import java.util.List;

/**
 * 会签串签等任务处理人员分配
 * @author xxm
 * @date 2022/9/4
 */
public interface BpmMultiInstanceAssignService {

    /**
     * 计算当前执行任务的处理人id集合
     */
    List<Long> getTaskUsers(DelegateExecution execution, MultiInstanceActivityBehavior multiInstanceActivityBehavior);
}

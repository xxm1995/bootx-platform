package cn.bootx.starter.flowable.listener;

import cn.bootx.common.core.util.LocalDateTimeUtil;
import cn.bootx.starter.flowable.core.instance.dao.BpmTaskManager;
import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEntityEvent;
import org.flowable.engine.delegate.event.AbstractFlowableEngineEventListener;
import org.flowable.task.api.Task;
import org.springframework.stereotype.Component;

/**   
 * Bpm 任务事件监听器
 * @author xxm  
 * @date 2022/8/24 
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class BpmTaskEventListener extends AbstractFlowableEngineEventListener {
    private final BpmTaskManager bpmTaskManager;

    @Override
    protected void taskCreated(FlowableEngineEntityEvent event) {
        Task task = (Task) event.getEntity();
        // 存储扩展内容
        BpmTask bpmTask = new BpmTask()
                .setTaskId(task.getId())
                .setExecutionId(event.getExecutionId())
                .setInstanceId(task.getProcessInstanceId())
                .setStartTime(LocalDateTimeUtil.of(task.getCreateTime()));
        System.out.println(bpmTask);
    }

    @Override
    protected void taskCompleted(FlowableEngineEntityEvent event) {
        System.out.println(1);
    }

    @Override
    protected void taskAssigned(FlowableEngineEntityEvent event) {
        System.out.println(event);
        // 判断扩展内容是否存在, 存的的话进行更新
    }


}

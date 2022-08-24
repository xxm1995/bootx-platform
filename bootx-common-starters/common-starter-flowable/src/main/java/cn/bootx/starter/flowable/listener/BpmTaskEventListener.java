package cn.bootx.starter.flowable.listener;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEntityEvent;
import org.flowable.engine.delegate.event.AbstractFlowableEngineEventListener;
import org.springframework.stereotype.Service;

/**   
 * Bpm 任务事件监听器
 * @author xxm  
 * @date 2022/8/24 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmTaskEventListener extends AbstractFlowableEngineEventListener {

    @Override
    protected void taskCreated(FlowableEngineEntityEvent event) {
        // TODO 存储扩展内容
    }

    @Override
    protected void taskCompleted(FlowableEngineEntityEvent event) {
        System.out.println(1);
    }

    @Override
    protected void taskAssigned(FlowableEngineEntityEvent event) {
        System.out.println(1);
        // TODO 更新信息
    }


}

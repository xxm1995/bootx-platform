package cn.bootx.office.handler.message;

import cn.bootx.notice.core.site.service.SiteMessageService;
import cn.bootx.starter.flowable.event.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Service;

/**
 * 消息发送
 * @author xxm  
 * @date 2022/9/18 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmTaskNoticeService {
    private final SiteMessageService messageService;

    /**   
     * 流程任务创建事件
     */
    @EventListener
    public void taskCreated(TaskCreatedEvent event){
        
    }

    /**
     * 流程任务更改处理人事件
     */
    @EventListener
    public void taskAssign(TaskAssignEvent event){
        // 发送给原处理人

        // 发送给新处理人
    }

    /**
     * 流程任务完成事件
     */
    @EventListener
    public void taskCompleted(TaskCompletedEvent event){

    }

    /**
     * 流程任务取消事件
     */
    @EventListener
    public void taskCancel(TaskCancelEvent event){

    }

    /**
     * 流程任务驳回事件
     */
    @EventListener
    public void taskRe(TaskRejectEvent event){

    }
}

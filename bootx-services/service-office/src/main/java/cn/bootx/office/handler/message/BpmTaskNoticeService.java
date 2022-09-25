package cn.bootx.office.handler.message;

import cn.bootx.notice.core.site.service.SiteMessageService;
import cn.bootx.notice.core.template.service.MessageTemplateService;
import cn.bootx.office.code.NoticeMessageCode;
import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import cn.bootx.starter.flowable.event.*;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.retry.annotation.Backoff;
import org.springframework.retry.annotation.Retryable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

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
    private final MessageTemplateService messageTemplateService;

    /**   
     * 流程任务创建事件
     */
    @EventListener
    public void taskCreated(TaskCreatedEvent event){
        BpmTask bpmTask = event.getBpmTask();
        Map<String,Object> map = new HashMap<>();
        String title = StrUtil.format("{} 的 {} 需要处理", bpmTask.getInstanceName(),bpmTask.getNodeName());
        String content = messageTemplateService.rendering(NoticeMessageCode.BPM_TASK_CREATED, map);
        messageService.sendSingleUserBySystem(title,content,bpmTask.getUserId());
    }

    /**
     * 流程任务更改处理人事件
     */
    @EventListener
    @Transactional(rollbackFor = Exception.class)
    @Retryable(value = Exception.class, maxAttempts = 2, backoff = @Backoff(value = 2000L))
    public void taskAssign(TaskAssignEvent event){
        // 发送给原处理人
        BpmTask bpmTask = event.getBpmTask();
        Map<String,Object> oldMap = new HashMap<>();
        String oldTitle = StrUtil.format("{} 的 {} 任务已成功被委派给 {}",bpmTask.getInstanceName(),bpmTask.getNodeName(),event.getNewAssignName());
        String oldContent = messageTemplateService.rendering(NoticeMessageCode.BPM_TASK_ASSIGN_CANCEL, oldMap);
        messageService.sendSingleUserBySystem(oldTitle,oldContent,event.getOldAssign());
        // 发送给新处理人
        Map<String,Object> newMap = new HashMap<>();
        String newTitle = StrUtil.format("{} 的 {} {} 任务已经委派给您",event.getOldAssignName(),bpmTask.getInstanceName(),bpmTask.getNodeName());
        String newContent = messageTemplateService.rendering(NoticeMessageCode.BPM_TASK_ASSIGN_CREATED, newMap);
        messageService.sendSingleUserBySystem(newTitle,newContent,event.getNewAssign());
    }

    /**
     * 流程任务完成事件
     */
    @EventListener
    public void taskCompleted(TaskCompletedEvent event){
        if (!event.isMulti()){
            return;
        }
        for (BpmTask bpmTask : event.getBpmTasks()) {
            // 发送给新处理人
            Map<String,Object> newMap = new HashMap<>();
            String newTitle = StrUtil.format("{} {} 任务已经被完成",bpmTask.getInstanceName(),bpmTask.getNodeName());
            String newContent = messageTemplateService.rendering(NoticeMessageCode.BPM_TASK_COMPLETED, newMap);
            messageService.sendSingleUserBySystem(newTitle,newContent,bpmTask.getUserId());
        }
    }

    /**
     * 流程任务取消事件
     */
    @EventListener
    public void taskCancel(TaskCancelEvent event){
        for (BpmTask bpmTask : event.getBpmTasks()) {
            Map<String,Object> map = new HashMap<>();
            String title = StrUtil.format("{} {} 任务已经被完成",bpmTask.getInstanceName(),bpmTask.getNodeName());
            String content = messageTemplateService.rendering(NoticeMessageCode.BPM_TASK_CANCEL, map);
            messageService.sendSingleUserBySystem(title,content,bpmTask.getUserId());
        }
    }

    /**
     * 流程任务驳回事件
     */
    @EventListener
    public void taskReject(TaskRejectEvent event){
        BpmTask bpmTask = event.getBpmTask();
        Map<String,Object> map = new HashMap<>();
        String title = StrUtil.format("{} {} 任务已经被被驳回",bpmTask.getInstanceName(),bpmTask.getNodeName());
        String content = messageTemplateService.rendering(NoticeMessageCode.BPM_TASK_REJECT, map);
        messageService.sendSingleUserBySystem(title,content,bpmTask.getUserId());
    }
}

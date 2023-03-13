package cn.bootx.office.handler.message;

import cn.bootx.notice.core.site.service.SiteMessageService;
import cn.bootx.notice.core.template.service.MessageTemplateService;
import cn.bootx.starter.flowable.core.instance.entity.BpmInstance;
import cn.bootx.starter.flowable.event.ProcessCancelEvent;
import cn.bootx.starter.flowable.event.ProcessCompletedEvent;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

import static cn.bootx.office.code.NoticeMessageCode.BPM_INSTANCE_CANCEL;
import static cn.bootx.office.code.NoticeMessageCode.BPM_INSTANCE_COMPLETED;

/**
 * 流程实例消息发送
 *
 * @author xxm
 * @date 2022/9/18
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmInstanceNoticeService {

    private final SiteMessageService messageService;

    private final MessageTemplateService messageTemplateService;

    /**
     * 流程完成时通知发起人
     */
    @EventListener
    public void ProcessCompleted(ProcessCompletedEvent event) {
        BpmInstance bpmInstance = event.getBpmInstance();
        // 发送完成消息
        String title = StrUtil.format("{} 流程执行完成", bpmInstance.getInstanceName());
        Map<String, Object> map = new HashMap<>();
        String content = messageTemplateService.rendering(BPM_INSTANCE_COMPLETED, map);
        messageService.sendSingleUserBySystem(title, content, bpmInstance.getStartUserId());
    }

    /**
     * 流程取消时通知发起人
     */
    @EventListener
    public void ProcessCancel(ProcessCancelEvent event) {
        BpmInstance bpmInstance = event.getBpmInstance();
        String title = StrUtil.format("{} 流程被取消", bpmInstance.getInstanceName());
        Map<String, Object> map = new HashMap<>();
        String content = messageTemplateService.rendering(BPM_INSTANCE_CANCEL, map);
        messageService.sendSingleUserBySystem(title, content, bpmInstance.getStartUserId());
    }

}

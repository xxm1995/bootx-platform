package cn.bootx.office.handler.message;

import cn.bootx.notice.core.site.service.SiteMessageService;
import cn.bootx.notice.param.site.SendSiteMessageParam;
import cn.bootx.starter.flowable.core.instance.entity.BpmInstance;
import cn.bootx.starter.flowable.event.ProcessCancelEvent;
import cn.bootx.starter.flowable.event.ProcessCompletedEvent;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Service;

import java.util.Collections;

import static cn.bootx.common.core.code.CommonCode.SYSTEM_DEFAULT_USERID;
import static cn.bootx.common.core.code.CommonCode.SYSTEM_DEFAULT_USERNAME;
import static cn.bootx.notice.code.SiteMessageCode.RECEIVE_USER;

/**
 * 流程实例消息发送
 * @author xxm  
 * @date 2022/9/18 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmInstanceNoticeService {
    private final SiteMessageService messageService;
    /**
     * 流程完成时通知发起人
     */
    @EventListener
    public void ProcessCompleted(ProcessCompletedEvent event){
        BpmInstance bpmInstance = event.getBpmInstance();
        // 发送完成消息
        String title = StrUtil.format("{} 执行完成");
        String content = StrUtil.format("{} 执行完成");;

        SendSiteMessageParam param = new SendSiteMessageParam()
                .setTitle(title)
                .setContent(content)
                .setSenderId(SYSTEM_DEFAULT_USERID)
                .setSenderName(SYSTEM_DEFAULT_USERNAME)
                .setReceiveType(RECEIVE_USER)
                .setReceiveIds(Collections.singletonList(bpmInstance.getStartUserId()));
//        messageService.send(param);


    }
    /**
     * 流程取消时通知发起人
     */
    @EventListener
    public void ProcessCancel(ProcessCancelEvent event){
        BpmInstance bpmInstance = event.getBpmInstance();
        // 发送取消消息

    }
}

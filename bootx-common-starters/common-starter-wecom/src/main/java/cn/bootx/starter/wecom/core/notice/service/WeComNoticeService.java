package cn.bootx.starter.wecom.core.notice.service;

import cn.bootx.starter.wecom.configuration.WeComProperties;
import cn.bootx.starter.wecom.core.notice.executor.RecallNoticeRequestExecutor;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.cp.api.WxCpMessageService;
import me.chanjar.weixin.cp.api.WxCpService;
import me.chanjar.weixin.cp.bean.message.WxCpMessage;
import me.chanjar.weixin.cp.bean.message.WxCpMessageSendResult;
import org.springframework.stereotype.Service;

import static cn.bootx.starter.wecom.code.WeComCode.NOTICE_RECALL_URL;

/**
* 企业微信消息发送
* @author xxm
* @date 2022/7/23
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class WeComNoticeService {
    private final WxCpService wxCpService;
    private final WeComProperties weComProperties;

    /**
     * 发送应用消息
     * @return 消息id, 可用于撤回
     */
    @SneakyThrows
    public String sendNotice(WxCpMessage message){
        WxCpMessageService messageService = wxCpService.getMessageService();
        message.setAgentId(weComProperties.getAgentId());
        WxCpMessageSendResult result = messageService.send(message);
        return result.getMsgId();
    }

    /**
     * 撤回应用消息
     * @param msgId 消息id
     */
    @SneakyThrows
    public void recallNotice(String msgId)  {
        wxCpService.execute(new RecallNoticeRequestExecutor(), NOTICE_RECALL_URL, msgId);
    }
}

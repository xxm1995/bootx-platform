package cn.bootx.notice.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.notice.core.dingtalk.entity.corp.DingCorpNoticeReceive;
import cn.bootx.notice.core.dingtalk.entity.msg.DingTextMsg;
import cn.bootx.notice.core.template.service.MessageTemplateService;
import cn.bootx.notice.service.DingTalkNoticeSender;
import cn.bootx.notice.service.EmailNoticeSender;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@Tag(name ="nc测试")
@RestController
@RequestMapping("/nc/test")
@RequiredArgsConstructor
public class NcDemoController {
    private final MessageTemplateService messageTemplateService;
    private final EmailNoticeSender mailSendService;
    private final DingTalkNoticeSender dingTalkNoticeSender;

    @Operation(summary = "消息发送测试")
    @GetMapping("/sendMsg")
    public ResResult<Void> sendMsg(){
        // 传入模板code和参数
        Map<String,Object> map = new HashMap<>();
        String data = messageTemplateService.rendering("code", map);
        // 调用发送
        mailSendService.sentSimpleMail("xxm@bootx.cn","测试邮件",data);
        return Res.ok();
    }

    @Operation(summary = "钉钉消息测试")
    @GetMapping("/sendDingMsg")
    public ResResult<Void> sendDingMsg(){
        DingTextMsg msg = new DingTextMsg("中文通知");
        DingCorpNoticeReceive receive = new DingCorpNoticeReceive()
                .setUseridList(Collections.singletonList(""));
        dingTalkNoticeSender.sendTextCorpNotice(msg,receive);
        return Res.ok();
    }
}

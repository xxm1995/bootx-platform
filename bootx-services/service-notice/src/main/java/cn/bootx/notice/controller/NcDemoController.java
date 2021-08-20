package cn.bootx.notice.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.notice.core.mail.service.MailSendService;
import cn.bootx.notice.core.template.service.MessageTemplateService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@Api(tags = "nc测试")
@RestController
@RequestMapping("/nc/test")
@RequiredArgsConstructor
public class NcDemoController {
    private final MessageTemplateService messageTemplateService;
    private final MailSendService mailSendService;

    @ApiOperation("消息发送测试")
    @GetMapping("/sendMsg")
    public ResResult<Void> sendMsg(){
        // 传入模板code和参数
        Map<String,String> map = new HashMap<>();
        String data = messageTemplateService.rendering("code", map);
        // 调用发送
        mailSendService.sentSimpleMail("xxm@bootx.cn","测试邮件",data);
        return Res.ok();
    }
}

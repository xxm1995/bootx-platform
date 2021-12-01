package cn.bootx.notice.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.notice.core.mail.service.MailSendService;
import cn.bootx.notice.dto.mail.SendMailParam;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
* @author xxm
* @date 2021/7/6
*/
@Tag(name ="邮件发送")
@RestController
@RequestMapping("/mail/send")
@RequiredArgsConstructor
public class MailSendController {
    private final MailSendService mailSendService;

    @Operation(summary = "发送邮件")
    @PostMapping("/sendMail")
    public ResResult<Boolean> sendMail(SendMailParam mailParam){
        mailSendService.sendHtmlMail(mailParam);
        return Res.ok(true);
    }

    @Operation(summary = "发送简单邮件")
    @PostMapping("/sentSimpleMail")
    public ResResult<Boolean> sentSimpleMail(String email,String subject,String msg){
        mailSendService.sentSimpleMail(email,subject,msg);
        return Res.ok(true);
    }
}

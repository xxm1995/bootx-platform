package cn.bootx.notice.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.notice.core.mail.service.MailSendService;
import cn.bootx.notice.dto.mail.SendMailParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
* @author xxm
* @date 2021/7/6
*/
@Api(tags = "邮件发送")
@RestController
@RequestMapping("/mail/send")
@RequiredArgsConstructor
public class MailSendController {
    private final MailSendService mailSendService;

    @ApiOperation(value = "发送邮件")
    @PostMapping(value = "/sendMail")
    public ResResult<Boolean> sendMail(SendMailParam mailParam){
        mailSendService.sendHtmlMail(mailParam);
        return Res.ok(true);
    }

    @ApiOperation(value = "发送简单邮件")
    @PostMapping(value = "/sentSimpleMail")
    public ResResult<Boolean> sentSimpleMail(String email,String subject,String msg){
        mailSendService.sentSimpleMail(email,subject,msg);
        return Res.ok(true);
    }
}

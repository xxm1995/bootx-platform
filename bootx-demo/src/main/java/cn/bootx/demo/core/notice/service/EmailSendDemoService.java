package cn.bootx.demo.core.notice.service;

import cn.bootx.notice.dto.mail.SendMailParam;
import cn.bootx.notice.service.EmailNoticeSender;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * 邮件消息发送测试
 *
 * @author xxm
 * @date 2022/8/3
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class EmailSendDemoService {

    private final EmailNoticeSender mailNoticeSender;

    /**
     * 简单方式邮件发送
     */
    public void sentSimpleMail(String email, String subject, String msg) {
        mailNoticeSender.sentSimpleMail(email, subject, msg);
    }

    /**
     * 标准邮件发送
     */
    public void sentMail(SendMailParam mailParam) {
        mailNoticeSender.sendMail(mailParam);
    }

}

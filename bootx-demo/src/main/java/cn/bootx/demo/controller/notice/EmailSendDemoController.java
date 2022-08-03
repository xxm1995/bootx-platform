package cn.bootx.demo.controller.notice;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.util.ValidationUtil;
import cn.bootx.demo.core.notice.entity.SendSimpleEmailDemoParam;
import cn.bootx.demo.core.notice.service.EmailSendDemoService;
import cn.bootx.notice.dto.mail.SendMailParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**   
 * 
 * @author xxm  
 * @date 2022/8/3 
 */
@Tag(name = "测试消息队列")
@RestController
@RequestMapping("/demo/notice/email")
@RequiredArgsConstructor
public class EmailSendDemoController {
    private final EmailSendDemoService service;
    
    @Operation(summary = "简单邮件发送")
    @PostMapping("/sentSimpleMail")
    public ResResult<Void>sentSimpleMail(@RequestBody SendSimpleEmailDemoParam param){
        ValidationUtil.validateParam(param);
        service.sentSimpleMail(param.getEmail(),param.getSubject(),param.getMessage());
        return Res.ok();
    }

    @Operation(summary = "标准邮件发送")
    @PostMapping("/sentMail")
    public ResResult<Void> sentMail(@RequestBody SendMailParam mailParam){
        ValidationUtil.validateParam(mailParam);
        service.sentMail(mailParam);
        return Res.ok();
    }
}

# 通知中心

## 能力
1. 模板管理(使用freemarker模板引擎)
2. 邮件发送
3. 站内信
4. 短信发送
5. 微信发送
6. 企业微信
7. 钉钉
   - 钉钉机器人
   - 钉钉消息
## 使用
### 模板管理
消息模板使用FreeMarker引擎，

### 发送消息
1. 引入对应的消息发送服务，如果使用到消息模板功能也同时引入
2. 调用消息发送服务的发送API方法，传入参数，进行发送
1. 演示代码
   ```java
   public class NcDemoController {
       private final MessageTemplateService messageTemplateService;
       private final MailSendService mailSendService;
   
       @Operation(summary = "消息发送测试")
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
   ```


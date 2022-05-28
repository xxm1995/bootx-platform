package cn.bootx.demo.controller.mq;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
* @author xxm
* @date 2022/5/27
*/
@Tag(name = "测试消息队列")
@RestController
@RequestMapping("/demo/mq")
@RequiredArgsConstructor
public class MessageQueueDemoController {
    
    @Operation(summary = "发送MQTT消息")
    @PostMapping("/sendMqttMsg")
    public ResResult<Void> sendMqttMsg(String msg){

        return Res.ok();
    }

    @Operation(summary = "发送RabbitMQ消息")
    @PostMapping("/sendRabbitMsg")
    public ResResult<Void> sendRabbitMsg(String msg){

        return Res.ok();
    }

    @Operation(summary = "发送Redis消息")
    @PostMapping("/sendRedisMsg")
    public ResResult<Void> sendRedisMsg(String msg){

        return Res.ok();
    }
}

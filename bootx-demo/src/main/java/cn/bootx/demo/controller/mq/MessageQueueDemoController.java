package cn.bootx.demo.controller.mq;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.jackson.util.JacksonUtil;
import cn.bootx.common.redis.RedisClient;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.nio.charset.StandardCharsets;

/**
* @author xxm
* @date 2022/5/27
*/
@Tag(name = "测试消息队列")
@RestController
@RequestMapping("/demo/mq")
@RequiredArgsConstructor
public class MessageQueueDemoController {
    private final RabbitTemplate rabbitTemplate;
    private final MqttClient mqttClient;
    private final RedisClient redisClient;
    private final RedisTemplate<String,?> redisTemplate;

    @SneakyThrows
    @Operation(summary = "发送MQTT消息")
    @PostMapping("/sendMqttMsg")
    public ResResult<Void> sendMqttMsg(String msg){
        String json = JacksonUtil.toJson(Res.ok(msg));
        MqttMessage mqttMessage = new MqttMessage(json.getBytes(StandardCharsets.UTF_8));
        mqttClient.publish("demo",mqttMessage);
        return Res.ok();
    }

    @Operation(summary = "发送RabbitMQ消息")
    @PostMapping("/sendRabbitMsg")
    public ResResult<Void> sendRabbitMsg(String msg){
        rabbitTemplate.convertAndSend(
                "service.demo",
                "demo.testMq",
                Res.ok(msg)
        );
        return Res.ok();
    }

    @Operation(summary = "发送RedisMq消息")
    @PostMapping("/sendRedisMsg")
    public ResResult<Void> sendRedisMsg(String msg){
        redisClient.convertAndSend("demo:redis", Res.ok(msg));
        return Res.ok();
    }
    
    @Operation(summary = "创建15秒后过期的事件")
    @PostMapping("/sendKeyExpired")
    public ResResult<Void> sendKeyExpired(String key){
        redisClient.setKeyExpired("demo:redis:expired:",key,15*1000);
        return Res.ok();
    }
}

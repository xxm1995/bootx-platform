package cn.bootx.demo.core.mq.mqtt;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

/**
*
* @author xxm
* @date 2022/5/30
*/
@Slf4j
@Configuration
@RequiredArgsConstructor
public class DemoMqttConfiguration {
    private final MqttClient mqttClient;
    private final DemoMqttMessageListener iotMessageListener;

    /**
     * 添加监听器
     */
    @PostConstruct
    public void listener(){
        try {
            if (mqttClient.isConnected()){
                mqttClient.subscribe("demo", iotMessageListener);
            } else {
                log.warn("服务器未连接，MQTT添加监听器失败");
            }
        } catch (MqttException e) {
            log.error("MQTT添加监听器失败",e);
        }
    }
}

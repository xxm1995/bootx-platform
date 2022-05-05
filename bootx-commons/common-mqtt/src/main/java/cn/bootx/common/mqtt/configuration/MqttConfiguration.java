package cn.bootx.common.mqtt.configuration;

import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * mqtt配置
 * @author xxm
 * @date 2022/4/25
 */
@Slf4j
@Configuration
@RequiredArgsConstructor
public class MqttConfiguration {
    private final MqttProperties mqttProperties;

    /**
     * mqtt终端
     */
    @Bean
    public MqttClient mqttClient(){
        MqttClient client = null;
        try {
            String clientId = mqttProperties.getClientId();
            if (mqttProperties.isAutomaticReconnect()){
                clientId = clientId+"@"+ RandomUtil.randomString(5);
            }
            client = new MqttClient(mqttProperties.getUrl(), clientId);
            // MQTT配置对象
            MqttConnectOptions options = new MqttConnectOptions();
            if (StrUtil.isNotBlank(mqttProperties.getName())){
                options.setUserName(mqttProperties.getName());
            }
            if (StrUtil.isNotBlank(mqttProperties.getPassword())){
                options.setPassword(mqttProperties.getPassword().toCharArray());
            }
            options.setCleanSession(mqttProperties.isCleanSession());
            options.setConnectionTimeout(mqttProperties.getConnectionTimeout());
            options.setKeepAliveInterval(mqttProperties.getKeepAliveInterval());
            options.setAutomaticReconnect(mqttProperties.isAutomaticReconnect());
            client.connect(options);
        } catch (MqttException e) {
            log.error("MQTT服务初始化失败",e);
        }
        return client;
    }

}

package cn.bootx.common.mqtt.configuration;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
* mqtt配置
* @author xxm
* @date 2022/4/25
*/
@Getter
@Setter
@ConfigurationProperties("bootx.common.mqtt")
public class MqttProperties {

    /** QTT服务地址 */
    private String url = "tcp://127.0.0.1:1883";
    /** 用户名 */
    private String name;
    /** 密码 */
    private String password;
    /** clientId */
    private String clientId;
}

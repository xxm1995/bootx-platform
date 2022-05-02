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
    /** 终端id */
    private String clientId = "";
    /** 自动追加终端id后缀 */
    private boolean autoClientIdSuffix = true;
    /** 连接超时 */
    private int connectionTimeout = 30;
    /** 清理会话 */
    private boolean cleanSession = true;
    /** 自动重连 */
    private boolean automaticReconnect = true;
    /** 保活间隔 */
    private int keepAliveInterval = 60;
}

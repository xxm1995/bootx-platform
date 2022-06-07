package cn.bootx.common.websocket.configuration;

import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingClass;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

/**   
*
* @author xxm  
* @date 2022/3/27 
*/
@EnableWebSocket
@Configuration
public class WebSocketConfig {
    /**
     * 注入一个ServerEndpointExporter,该Bean会自动注册使用@ServerEndpoint注解申明的websocket endpoint
     * plumelog 也导入了这个Bean, 在使用plumelog的情况下, 不在创建这个bean
     */
    @Bean
    @ConditionalOnMissingBean
    @ConditionalOnMissingClass("com.plumelog.lite.client.InitClientBean")
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }
}

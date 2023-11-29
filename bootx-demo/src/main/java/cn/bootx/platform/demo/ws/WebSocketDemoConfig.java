package cn.bootx.platform.demo.ws;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

/**
 *
 * @author xxm
 * @since 2023/11/29
 */
@Configuration
@RequiredArgsConstructor
public class WebSocketDemoConfig  implements WebSocketConfigurer {
    private final WebSocketDemoHandler webSocketDemoHandler;

    /**
     * 拦截器
     */
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry
                // WebSocket 连接处理器
                .addHandler(webSocketDemoHandler, "/test/ws")
                // 允许跨域
                .setAllowedOrigins("*");
    }
}

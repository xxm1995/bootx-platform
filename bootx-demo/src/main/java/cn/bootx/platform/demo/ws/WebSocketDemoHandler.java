package cn.bootx.platform.demo.ws;

import cn.bootx.platform.common.websocket.manager.SpringWebSocketSessionManager;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Websock Spring 演示
 * @author xxm
 * @since 2023/11/29
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class WebSocketDemoHandler extends TextWebSocketHandler {


    /** websocket连接管理器 */
    @Getter
    private static final SpringWebSocketSessionManager wsManager = new SpringWebSocketSessionManager();

    /** 记录当前在线连接数 */
    private static final AtomicInteger onlineCount = new AtomicInteger(0);

    /**
     * 连接建立成功调用的方法
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) {
        Map<String, WebSocketSession> sessionPool = wsManager.getSessionPool();
        sessionPool.put(session.getId(),session);
        onlineCount.incrementAndGet(); // 在线数加1
        this.sendMessage("连接成功",session.getId());
        log.info("有新连接加入，当前在线人数为：{}", onlineCount.get());
    }

    /**
     * 关闭
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
        onlineCount.decrementAndGet(); // 在线数减1
        String userId = wsManager.getIdBySession(session);
        wsManager.removeSession(session);
        log.info("有一连接关闭，当前在线人数为：{}", onlineCount.get());
    }

    /**
     * 接收消息
     */
    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) {
        log.info("服务端收到客户端的消息:{}", message);
        this.sendMessage("响应: " + message, session.getId());
    }

    /**
     * 错误
     */
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) {
        log.error("{} 发生错误", session.getId());
    }


    /**
     * 服务端发送消息给客户端(单发)
     */
    public void sendMessage(String message, String sid) {
        try {
            val session = wsManager.getSessionPool().get(sid);
            session.sendMessage(new TextMessage(message));
        }
        catch (Exception e) {
            log.error("服务端发送消息给客户端失败：", e);
        }
    }

}

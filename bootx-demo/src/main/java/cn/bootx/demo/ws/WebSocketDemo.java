package cn.bootx.demo.ws;

import cn.bootx.common.websocket.manager.WebSocketSessionManager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * websocket demo
 *
 * @author xxm
 * @date 2022/3/27
 */
@Slf4j
@Component
@ServerEndpoint("/test/ws/{userId}")
public class WebSocketDemo {

    private final WebSocketSessionManager wsManager = new WebSocketSessionManager();

    /** 记录当前在线连接数 */
    private static final AtomicInteger onlineCount = new AtomicInteger(0);

    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(@PathParam("userId") Long userId, Session session) {
        wsManager.addSession(String.valueOf(userId), session);
        onlineCount.incrementAndGet(); // 在线数加1
        log.info("有新连接加入：{}，当前在线人数为：{}", userId, onlineCount.get());
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(Session session) {
        onlineCount.decrementAndGet(); // 在线数减1
        String userId = wsManager.getIdBySession(session);
        wsManager.removeSession(session);
        log.info("有一连接关闭：{}，当前在线人数为：{}", userId, onlineCount.get());
    }

    /**
     * 收到客户端消息后调用的方法
     * @param message 客户端发送过来的消息
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        Long userId = Long.valueOf(wsManager.getIdBySession(session));
        log.info("服务端收到客户端[{}]的消息:{}", userId, message);
        this.sendMessage("响应: " + message, userId);
    }

    @OnError
    public void onError(Session session, Throwable error) {
        log.error("{} 发生错误", session.getId());
        error.printStackTrace();
    }

    /**
     * 服务端发送消息给客户端(单发)
     */
    public void sendMessage(String message, Long userId) {
        try {
            List<Session> sessions = wsManager.getSessionsById(String.valueOf(userId));

            for (Session session : sessions) {
                session.getBasicRemote().sendText(message);
            }
        }
        catch (Exception e) {
            log.error("服务端发送消息给客户端失败：", e);
        }
    }

    /**
     * 服务端发送消息给客户端(全发)
     */
    public void sendMessage(String message) {
        try {
            ArrayList<Session> sessions = wsManager.getSessions();
            for (Session session : sessions) {
                session.getBasicRemote().sendText(message);
            }
        }
        catch (Exception e) {
            log.error("服务端发送消息给客户端失败：", e);
        }
    }

}

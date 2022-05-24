package cn.bootx.demo.ws;

import cn.hutool.core.map.BiMap;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.HashMap;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

/**
* websocket demo
* @author xxm
* @date 2022/3/27
*/
@Slf4j
@Component
@ServerEndpoint("/test/ws/{userId}")
public class WebSocketDemo {

    /** 记录当前在线连接数 */
    private static final AtomicInteger onlineCount = new AtomicInteger(0);

    /**
     * 线程安全Map
     */
    private static ConcurrentHashMap<String, Session> sessionPool = new ConcurrentHashMap<>();
    private static BiMap<Long, String> userSessionIdMap = new BiMap<>(new HashMap<>());

    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(@PathParam("userId") Long userId,Session session) {
        try {
            userSessionIdMap.put(userId,session.getId());
            sessionPool.put(session.getId(), session);
            onlineCount.incrementAndGet(); // 在线数加1
            log.info("有新连接加入：{}，当前在线人数为：{}", userId, onlineCount.get());
        } catch (Exception ignored) {
        }
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(Session session) {
        onlineCount.decrementAndGet(); // 在线数减1
        sessionPool.remove(session.getId());
        Long userId = userSessionIdMap.getKey(session.getId());
        userSessionIdMap.remove(userId);
        log.info("有一连接关闭：{}，当前在线人数为：{}", userId, onlineCount.get());
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        Long userId = userSessionIdMap.getKey(session.getId());
        log.info("服务端收到客户端[{}]的消息:{}", userId, message);
        this.sendMessage("响应: "+message,userId);
    }

    @OnError
    public void onError(Session session, Throwable error) {
        log.error("{} 发生错误",session.getId());
        error.printStackTrace();
    }

    /**
     * 服务端发送消息给客户端(单发)
     */
    public void sendMessage(String message, Long userId) {
        try {
            Session session = sessionPool.get(userSessionIdMap.get(userId));
            if (Objects.nonNull(session)){
                session.getBasicRemote().sendText(message);
            }
        } catch (Exception e) {
            log.error("服务端发送消息给客户端失败：", e);
        }
    }

    /**
     * 服务端发送消息给客户端(全发)
     */
    public void sendMessage(String message) {
        try {
            for (Session session : sessionPool.values()) {
                session.getBasicRemote().sendText(message);
            }
        } catch (Exception e) {
            log.error("服务端发送消息给客户端失败：", e);
        }
    }

}

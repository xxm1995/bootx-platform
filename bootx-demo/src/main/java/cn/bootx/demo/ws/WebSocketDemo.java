package cn.bootx.demo.ws;

import cn.bootx.common.core.util.CollUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
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
    private static final Map<String, Session> sessionPool = new ConcurrentHashMap<>();
    private static final Map<String, Long> sid2uid = new ConcurrentHashMap<>();
    private static final Map<Long, List<String>> uid2sid = new ConcurrentHashMap<>();

    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(@PathParam("userId") Long userId,Session session) {
        try {
            sid2uid.put(session.getId(),userId);
            sessionPool.put(session.getId(),session);
            List<String> list = Optional.ofNullable(uid2sid.get(userId))
                    .orElse(new CopyOnWriteArrayList<>());
            list.add(session.getId());
            uid2sid.put(userId,list);
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
        Long userId = sid2uid.remove(session.getId());
        Optional.ofNullable(uid2sid.get(userId))
                .ifPresent(list->list.removeIf(s->Objects.equals(s,session.getId())));
        log.info("有一连接关闭：{}，当前在线人数为：{}", userId, onlineCount.get());
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        Long userId = sid2uid.get(session.getId());
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
            List<String> sessionIds = uid2sid.get(userId);
            if (CollUtil.isNotEmpty(sessionIds)){
                for (String sessionId : sessionIds) {
                    Session session = sessionPool.get(sessionId);
                    if (Objects.nonNull(session)){
                        session.getBasicRemote().sendText(message);
                    }
                }
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

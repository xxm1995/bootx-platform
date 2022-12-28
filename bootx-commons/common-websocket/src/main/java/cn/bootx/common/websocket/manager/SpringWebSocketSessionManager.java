package cn.bootx.common.websocket.manager;

import cn.hutool.core.collection.ListUtil;
import com.google.common.collect.Lists;
import org.springframework.web.socket.WebSocketSession;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.stream.Collectors;

/**
 * websocket管理器 (Spring封装的socket)
 * @author xxm
 * @date 2022/5/27
 */
public class SpringWebSocketSessionManager {
    // session缓存
    protected static final Map<String, WebSocketSession> sessionPool = new ConcurrentHashMap<>();
    // sessionId 与 用户标识id 的映射关系 n:1
    protected static final Map<String, String> sid2uid = new ConcurrentHashMap<>();
    // 用户标识id 与 sessionId 的映射关系 1:n
    protected static final Map<String, List<String>> uid2sid = new ConcurrentHashMap<>();

    /**
     * 添加会话session关联
     */
    public void addSession(String userId, WebSocketSession session) {
        try {
            sid2uid.put(session.getId(),userId);
            sessionPool.put(session.getId(),session);
            List<String> list = Optional.ofNullable(uid2sid.get(userId))
                    .orElse(new CopyOnWriteArrayList<>());
            list.add(session.getId());
            uid2sid.put(userId,list);
        } catch (Exception ignored) {
        }
    }

    /**
     * 删掉 连接Session
     */
    public void removeSession(WebSocketSession session) {
        sessionPool.remove(session.getId());
        String id = sid2uid.remove(session.getId());
        Optional.ofNullable(uid2sid.get(id))
                .ifPresent(list->list.removeIf(s-> Objects.equals(s,session.getId())));
    }
    /**
     * 删除
     */
    public void removeSessionById(String id){
        List<String> sessionIds = Optional.ofNullable(uid2sid.get(id)).orElse(Lists.newArrayList());
        sessionIds.forEach(sessionPool::remove);
        sessionIds.forEach(sid2uid::remove);
        uid2sid.remove(id);

    }
    /**
     * 根据id获取关联的session列表
     */
    public List<WebSocketSession> getSessionsById(String id){
        List<String> sessionIds = Optional.ofNullable(uid2sid.get(id)).orElse(Lists.newArrayList());
        return sessionIds.stream().map(sessionPool::get)
                .collect(Collectors.toList());
    }

    /**
     * 获取所有连接session
     */
    public List<WebSocketSession> getSessions(){
        return ListUtil.toList(sessionPool.values());
    }


    /**
     * 根据session获取连接id
     */
    public String getIdBySession(WebSocketSession session){
        return sid2uid.get(session.getId());
    }

    /**
     * 根据session获取连接id
     */
    public String getIdBySessionId(String sessionId){
        return sid2uid.get(sessionId);
    }
}

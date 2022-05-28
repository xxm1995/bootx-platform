package cn.bootx.common.websocket.service;

import cn.hutool.core.collection.ListUtil;

import javax.websocket.Session;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.stream.Collectors;

/**
* websocket抽象类
* @author xxm
* @date 2022/5/27
*/
public class WebSocketSessionManager {
    // session缓存
    protected static final Map<String, Session> sessionPool = new ConcurrentHashMap<>();
    // sessionId 与 连接id 的映射关系 n:1
    protected static final Map<String, String> sid2id = new ConcurrentHashMap<>();
    // 连接id 与 sessionId 的映射关系 1:n
    protected static final Map<String, List<String>> id2sid = new ConcurrentHashMap<>();

    /**
     * 添加会话session关联
     */
    public void addSession(String id, Session session) {
        try {
            sid2id.put(session.getId(),id);
            sessionPool.put(session.getId(),session);
            List<String> list = Optional.ofNullable(id2sid.get(id))
                    .orElse(new CopyOnWriteArrayList<>());
            list.add(session.getId());
            id2sid.put(id,list);
        } catch (Exception ignored) {
        }
    }

    /**
     * 删掉 连接Session
     */
    public void removeSession(Session session) {
        sessionPool.remove(session.getId());
        String id = sid2id.remove(session.getId());
        Optional.ofNullable(id2sid.get(id))
                .ifPresent(list->list.removeIf(s-> Objects.equals(s,session.getId())));
    }
    /**
     * 删除
     */
    public void removeSessionById(String id){
        List<String> sessionIds = id2sid.get(id);
        sessionIds.forEach(sessionPool::remove);
        sessionIds.forEach(sid2id::remove);
        id2sid.remove(id);

    }
    /**
     * 根据id获取关联的session列表
     */
    public List<Session> getSessionsById(String id){
        List<String> sessionIds = id2sid.get(id);
        return sessionIds.stream().map(sessionPool::get)
                .collect(Collectors.toList());
    }

    /**
     * 获取所有连接session
     */
    public ArrayList<Session> getSessions(){
        return ListUtil.toList(sessionPool.values());
    }


    /**
     * 根据session获取连接id
     */
    public String getIdBySession(Session session){
        return sid2id.get(session.getId());
    }

    /**
     * 根据session获取连接id
     */
    public String getIdBySessionId(String sessionId){
        return sid2id.get(sessionId);
    }
}

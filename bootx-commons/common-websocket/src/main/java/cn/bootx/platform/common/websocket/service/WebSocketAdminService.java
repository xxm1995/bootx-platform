package cn.bootx.platform.common.websocket.service;

import cn.bootx.platform.common.websocket.manager.SpringWebSocketSessionManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.WebSocketSession;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * websocket会话管理
 * @author xxm
 * @since 2023/10/15
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class WebSocketAdminService {


    /**
     * 分页
     */
    public void page(){
        Map<String, List<String>> uid2sid = SpringWebSocketSessionManager.getUid2sid();
    }

    /**
     * 获取用户链接数
     */
    public void getByUserId(String userId){
        List<String> sessionIds = SpringWebSocketSessionManager.getUid2sid()
                .get(userId);
        Map<String, WebSocketSession> sessionPool = SpringWebSocketSessionManager.getSessionPool();
        // 组装用户信息
        val userSession = sessionIds.stream()
                .map(sessionPool::get)
                .map(session->{
                    System.out.println(session.getRemoteAddress());
                    return session;
                })
                .collect(Collectors.toList());
    }

}

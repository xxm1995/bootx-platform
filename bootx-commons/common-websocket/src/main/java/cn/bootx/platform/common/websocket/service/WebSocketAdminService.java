package cn.bootx.platform.common.websocket.service;

import cn.bootx.platform.common.websocket.manager.SpringWebSocketSessionManager;
import cn.bootx.platform.common.websocket.notice.UserNoticeWebSocketHandler;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
        SpringWebSocketSessionManager wsManager = UserNoticeWebSocketHandler.getWsManager();

        // 获取用户ids
        Map<String, List<String>> uid2sid = wsManager.getUid2sid();
        for (String uid : uid2sid.keySet()) {
            // 组装用户信息
        }
    }

    /**
     * 获取用户链接数
     */
    public void getSessionByUserId(String userId){
        SpringWebSocketSessionManager wsManager = UserNoticeWebSocketHandler.getWsManager();
        List<String> sessionIds = wsManager.getUid2sid()
                .get(userId);
        Map<String, WebSocketSession> sessionPool = wsManager.getSessionPool();
        // 组装用户信息
        List<WebSocketSession> userSession = sessionIds.stream()
                .map(sessionPool::get)
                .map(session -> {
                    System.out.println(session.getRemoteAddress());
                    return session;
                })
                .collect(Collectors.toList());
    }

}

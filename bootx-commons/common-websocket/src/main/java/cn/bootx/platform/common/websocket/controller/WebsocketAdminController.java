package cn.bootx.platform.common.websocket.controller;

import cn.bootx.platform.common.websocket.service.WebSocketAdminService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author xxm
 * @since 2023/10/15
 */
@Tag(name = "websocket会话管理")
@RestController
@RequestMapping("/websocket/admin")
@RequiredArgsConstructor
public class WebsocketAdminController {
    private final WebSocketAdminService webSocketAdminService;
}

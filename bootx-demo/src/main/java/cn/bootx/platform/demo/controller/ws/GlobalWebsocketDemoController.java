package cn.bootx.platform.demo.controller.ws;

import cn.bootx.platform.common.websocket.entity.WsRes;
import cn.bootx.platform.common.websocket.service.UserWsNoticeService;
import cn.bootx.platform.common.core.rest.Res;
import cn.bootx.platform.common.core.rest.ResResult;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author xxm
 * @since 2022/6/10
 */
@Tag(name = "全局websocket通知demo")
@RestController
@RequestMapping("/demo/global/ws")
@RequiredArgsConstructor
public class GlobalWebsocketDemoController {

    private final UserWsNoticeService userWsNoticeService;

    @Operation(summary = "发送消息")
    @PostMapping("/send")
    public ResResult<Void> send(Long userId, String msg) {
        userWsNoticeService.sendMessageByUser(WsRes.eventNotice(msg, "event_test_websocket"), userId);
        return Res.ok();
    }

}

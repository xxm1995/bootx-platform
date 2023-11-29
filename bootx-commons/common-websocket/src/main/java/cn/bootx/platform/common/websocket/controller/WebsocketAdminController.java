package cn.bootx.platform.common.websocket.controller;

import cn.bootx.platform.common.core.rest.Res;
import cn.bootx.platform.common.core.rest.ResResult;
import cn.bootx.platform.common.core.rest.param.PageParam;
import cn.bootx.platform.common.websocket.service.WebSocketAdminService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.web.bind.annotation.GetMapping;
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

    @Operation(summary = "分页")
    @GetMapping("/page")
    public ResResult<Void> page(@ParameterObject PageParam param){
        webSocketAdminService.page();
        return Res.ok();
    }

}

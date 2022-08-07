package cn.bootx.starter.wechat.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.starter.wechat.core.menu.service.WeChatMenuService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import me.chanjar.weixin.common.bean.menu.WxMenu;
import me.chanjar.weixin.mp.bean.menu.WxMpMenu;
import org.springframework.web.bind.annotation.*;

/**
 * 微信菜单管理
 * @author xxm
 * @date 2022/8/6
 */
@Tag(name = "微信菜单管理")
@RestController
@RequestMapping("/wechat/menu")
@RequiredArgsConstructor
public class WeChatMenuController {
    private final WeChatMenuService weChatMenuService;

    @Operation(summary = "发布菜单")
    @PostMapping("/publish")
    public ResResult<Void> publish(@RequestBody WxMenu menu){
        weChatMenuService.publish(menu);
        return Res.ok();
    }

    @Operation(summary = "获取微信菜单")
    @GetMapping("/getMenus")
    public ResResult<WxMpMenu> getMenus(){
        return Res.ok(weChatMenuService.getMenus());
    }
}

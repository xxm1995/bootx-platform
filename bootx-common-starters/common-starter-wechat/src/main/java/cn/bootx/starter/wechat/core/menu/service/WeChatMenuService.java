package cn.bootx.starter.wechat.core.menu.service;

import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.bean.menu.WxMenu;
import me.chanjar.weixin.common.bean.menu.WxMenuButton;
import me.chanjar.weixin.mp.api.WxMpMenuService;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.menu.WxMpMenu;
import org.springframework.stereotype.Service;

import java.util.Collections;

/**   
 * 微信菜单
 * @author xxm  
 * @date 2022/8/6 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class WeChatMenuService {
    private final WxMpService wxMpService;

    /**
     * 添加菜单
     */
    @SneakyThrows
    public void publish(){
        WxMpMenuService menuService = wxMpService.getMenuService();
        WxMenu menu = new WxMenu();

        WxMenuButton wxMenuButton = new WxMenuButton();
        val a =  new WxMenuButton();
        a.setName("测试菜单");
        a.setType(WxConsts.MenuButtonType.PIC_SYSPHOTO);
        a.setKey("cs");
        wxMenuButton.setName("父菜单");
        wxMenuButton.setSubButtons(Collections.singletonList(a));

        menu.setButtons(Collections.singletonList(wxMenuButton));
        menuService.menuCreate(menu);
    }

    /**
     * 获取菜单
     */
    @SneakyThrows
    public WxMpMenu getMenus(){
        WxMpMenuService menuService = wxMpService.getMenuService();
        WxMpMenu wxMpMenu = menuService.menuGet();
        System.out.println(wxMpMenu);
        return wxMpMenu;
    }
}

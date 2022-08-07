package cn.bootx.starter.wechat.core.menu.service;

import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.bean.menu.WxMenu;
import me.chanjar.weixin.mp.api.WxMpMenuService;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.menu.WxMpMenu;
import org.springframework.stereotype.Service;

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
    public void publish(WxMenu menu){
        WxMpMenuService menuService = wxMpService.getMenuService();
        menuService.menuCreate(menu);
    }

    /**
     * 获取微信菜单
     */
    @SneakyThrows
    public WxMpMenu getMenus(){
        WxMpMenuService menuService = wxMpService.getMenuService();
        WxMpMenu wxMpMenu = menuService.menuGet();
        System.out.println(wxMpMenu);
        return wxMpMenu;
    }
}

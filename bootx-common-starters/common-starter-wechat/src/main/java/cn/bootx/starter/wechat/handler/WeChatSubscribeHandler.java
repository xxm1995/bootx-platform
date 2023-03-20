package cn.bootx.starter.wechat.handler;

import cn.bootx.starter.wechat.core.login.service.WeChatQrLoginService;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.session.WxSessionManager;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import me.chanjar.weixin.mp.builder.outxml.TextBuilder;
import org.springframework.stereotype.Component;

import java.util.Map;

import static cn.bootx.starter.wechat.code.WeChatCode.EVENT_KEY_QRSCENE;

/**
 * 新增关注订阅消息
 *
 * @author xxm
 * @date 2022/7/16
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class WeChatSubscribeHandler implements WeChatMpMessageHandler {

    private final WeChatQrLoginService weChatQrLoginService;

    @Override
    public String getEvent() {
        return WxConsts.EventType.SUBSCRIBE;
    }

    @Override
    public WxMpXmlOutMessage handle(WxMpXmlMessage wxMessage, Map<String, Object> context, WxMpService wxMpService,
            WxSessionManager sessionManager) {
        String openId = wxMessage.getFromUser();
        log.info("新关注用户 OPENID: " + openId);
        // 判断是否携带扫码登录参数,
        if (StrUtil.startWith(wxMessage.getEventKey(), EVENT_KEY_QRSCENE)) {
            // 将扫码获取的二维码key值进行保存
            String qrCodeKey = StrUtil.subAfter(wxMessage.getEventKey(), EVENT_KEY_QRSCENE, true);
            weChatQrLoginService.setOpenId(qrCodeKey, openId);
        }

        return new TextBuilder().fromUser(wxMessage.getToUser()).toUser(wxMessage.getFromUser()).content("感谢关注")
                .build();
    }

}

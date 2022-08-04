package cn.bootx.starter.wechat.controller;

import cn.bootx.common.core.annotation.IgnoreAuth;
import cn.bootx.starter.wechat.core.login.service.WeChatQrLoginService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 微信
 * @author xxm
 * @date 2022/8/4
 */
@IgnoreAuth
@Tag(name = "微信扫码挡路")
@RestController
@RequestMapping("/wechat/login/qr")
@RequiredArgsConstructor
public class WeChatQrLoginController {
    private final WeChatQrLoginService weChatQrLoginService;

}

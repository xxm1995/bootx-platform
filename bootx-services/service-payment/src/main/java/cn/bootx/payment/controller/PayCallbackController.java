package cn.bootx.payment.controller;

import cn.bootx.payment.core.paymodel.alipay.service.AliPayCallbackService;
import cn.bootx.payment.core.paymodel.wechat.service.WeChatPayCallbackService;
import com.ijpay.alipay.AliPayApi;
import com.ijpay.core.kit.HttpKit;
import com.ijpay.core.kit.WxPayKit;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
*
* @author xxm
* @date 2021/2/27
*/
@Slf4j
@Api(tags = "支付回调")
@RestController
@RequestMapping("/callback")
@AllArgsConstructor
public class PayCallbackController {
    private final AliPayCallbackService aliPayCallbackService;
    private final WeChatPayCallbackService weChatPayCallbackService;

    @SneakyThrows
    @ApiOperation("支付宝回调")
    @PostMapping("/aliPay")
    public String aliPay(HttpServletRequest request){
        Map<String, String> stringStringMap = AliPayApi.toMap(request);
        return aliPayCallbackService.payCallback(stringStringMap);
    }

    @SneakyThrows
    @ApiOperation("微信支付回调")
    @PostMapping("/wechat")
    public String wechat(HttpServletRequest request){
        String xmlMsg = HttpKit.readData(request);
        Map<String, String> params = WxPayKit.xmlToMap(xmlMsg);
        return weChatPayCallbackService.payCallback(params);
    }

}

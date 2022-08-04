package cn.bootx.starter.wechat.core.login.service;

import cn.bootx.common.redis.RedisClient;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.mp.api.WxMpQrcodeService;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpQrCodeTicket;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * 扫码事件
 * @author xxm
 * @date 2022/8/4
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class WeChatQrLoginService {
    private final RedisClient redisClient;
    private final WxMpService wxMpService;

    private final String PREFIX_KEY = "third:wechat:login:qr:";

    /**
     * 申请待扫描的二维码
     */
    @SneakyThrows
    public String applyQrCode(){
        WxMpQrcodeService qrcodeService = wxMpService.getQrcodeService();
        long timeout = 5 * 60 * 1000;
        WxMpQrCodeTicket wxMpQrCodeTicket = qrcodeService.qrCodeCreateTmpTicket(1, (int) timeout);
        String url = wxMpQrCodeTicket.getUrl();
        String qrCodeKey = StrUtil.subAfter(url,"/q/",true);
        redisClient.setWithTimeout(PREFIX_KEY+qrCodeKey,"", timeout);
        return qrCodeKey;
    }

    /**
     * 查询二维码状态 等待扫码/登录成功/过期
     */
    public String getStatus(String key){
        String openId = redisClient.get(PREFIX_KEY + key);

        if (Objects.isNull(openId)){
            return "过期";
        } else if (StrUtil.isBlank(openId)){
            return "未扫码";
        } else {
            return "ok";
        }
    }

    /**
     * 设置微信openId
     */
    public void setOpenId(String key,String openId){
        if (redisClient.exists(PREFIX_KEY+key)){
            redisClient.set(PREFIX_KEY+key,openId);
        }
    }

    /**
     * 获取 openId
     */
    public String getOpenId(String key){
        return redisClient.get(PREFIX_KEY + key);
    }

    /**
     * 清除扫码信息
     */
    public void clear(String key){
        redisClient.deleteKey(PREFIX_KEY+key);
    }

}

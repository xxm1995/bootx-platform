package cn.bootx.baseapi.core.captcha.service;

import cn.bootx.baseapi.dto.captcha.CaptchaDataResult;
import cn.bootx.common.redis.RedisClient;
import cn.hutool.core.util.RandomUtil;
import com.wf.captcha.ArithmeticCaptcha;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**   
* 验证码服务
* @author xxm  
* @date 2021/8/2 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class CaptchaService {
    // redis key前缀
    private final String smsCaptchaPrefix = "login:captcha:sms";
    private final String imgCaptchaPrefix = "login:captcha:img";

    private final RedisClient redisClient;

    /**
     * 获取图片验证码
     */
    public CaptchaDataResult imgCaptcha(){
        String key = RandomUtil.randomString(16);
        // 几位数运算，默认是两位
        ArithmeticCaptcha captcha = new ArithmeticCaptcha(105,35);
        // 获取运算的结果
        String text = captcha.text();
        log.info("获取图片验证码: {}",text);
        redisClient.setWithTimeout(imgCaptchaPrefix +key, text,5*60*1000);
        return new CaptchaDataResult()
                .setCaptchaKey(key)
                .setCaptchaData(captcha.toBase64());
    }

    /**
     * 校验图片验证码
     */
    public boolean validateImgCaptcha(String key, String captcha){
        // 比较验证码是否正确
        String captchaByRedis = redisClient.get(imgCaptchaPrefix +key);
        return Objects.equals(captcha,captchaByRedis);
    }

    /**
     * 失效图片验证码
     */
    public void deleteImgCaptcha(String key){
        redisClient.deleteKey(imgCaptchaPrefix +key);
    }

    /**
     * 发送手机验证码
     */
    public int sendSmsCaptcha(String phone,long timeoutSec){
        int captcha = RandomUtil.randomInt(100000, 1000000);
        log.info("短信验证码: {}",captcha);
        redisClient.setWithTimeout(smsCaptchaPrefix+phone, String.valueOf(captcha),timeoutSec*1000);
        return captcha;
    }

    /**
     * 校验手机验证码
     */
    public boolean validateSmsCaptcha(String phone, String captcha){
        // 比较验证码是否正确
        String captchaByRedis = redisClient.get(smsCaptchaPrefix+phone);
        return Objects.equals(captcha,captchaByRedis);
    }

    /**
     * 失效手机验证码
     */
    public void deleteSmsCaptcha(String phone){
        redisClient.deleteKey(smsCaptchaPrefix+phone);
    }
}

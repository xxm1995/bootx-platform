package cn.bootx.starter.auth.config;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.ArrayList;
import java.util.List;

/**   
* 认证参数
* @author xxm  
* @date 2021/7/30 
*/
@Slf4j
@Getter
@Setter
@ConfigurationProperties(prefix = "bootx.starter.auth")
public class AuthProperties {

    /**
     * 不进行鉴权的路径
     */
    private List<String> ignoreUrls = new ArrayList<>();

    /**
     * 是否开启验证码验证
     */
    private boolean captcha;

    /**
     * 验证码有效时间(秒)
     */
    private int captchaTimeout = 60;

    /**
     * 盐值
     */
    private String salt = "salt";

    /**
     * 默认密码
     */
    private String defaultPassword = "123456";

    /**
     * openId类型参数名称
     */
    private String openIdTypeParameter = "openIdType";



}

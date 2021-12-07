package cn.bootx.starter.auth.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.ArrayList;
import java.util.List;

/**   
* 认证参数
* @author xxm  
* @date 2021/7/30 
*/
@Getter
@Setter
@ConfigurationProperties(prefix = "bootx.starter.auth")
public class AuthProperties {

    /**
     * 不进行鉴权的路径
     */
    private List<String> ignoreUrls = new ArrayList<>();

    /**
     * 盐值
     */
    private String salt = "salt";

    /**
     * 默认密码
     */
    private String defaultPassword = "123456";

    /**
     * openId类型参数名称(第三方登录传入的参数名)
     */
    private String openIdTypeParameter = "openIdType";

}

package cn.bootx.starter.auth.entity;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.starter.auth.config.AuthProperties;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotNull;

/**   
* 认证上下文
* @author xxm  
* @date 2022/4/23 
*/
@Getter
@Setter
@Accessors(chain = true)
public class LoginAuthContext {

    /** 请求 */
    @NotNull
    private HttpServletRequest request;

    /** 响应 */
    @NotNull
    private HttpServletResponse response;

    /** 认证终端信息 */
    @NotNull
    private AuthClient authClient;

    /** 用户对象 */
    private UserDetail userDetail;

    /** 认证参数配置 */
    @NotNull
    private AuthProperties authProperties;
}

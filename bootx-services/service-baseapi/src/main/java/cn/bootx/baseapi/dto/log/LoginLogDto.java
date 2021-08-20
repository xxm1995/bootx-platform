package cn.bootx.baseapi.dto.log;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**   
* 登录日志
* @author xxm  
* @date 2021/8/12 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel("登录日志")
public class LoginLogDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = 2985633896134425505L;

    /** 用户账号 */
    private Long userId;

    /** 用户账号 */
    private String userName;

    /** 登录成功状态*/
    private boolean login;

    /** 登录IP地址 */
    private String ipaddr;

    /** 登录地点 */
    private String loginLocation;

    /** 浏览器类型 */
    private String browser;

    /** 操作系统 */
    private String os;

    /** 提示消息 */
    private String msg;

    /** 访问时间 */
    private LocalDateTime loginTime;
}

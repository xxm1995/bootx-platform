package cn.bootx.starter.audit.log.core.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.starter.audit.log.core.convert.LogConvert;
import cn.bootx.starter.audit.log.dto.LoginLogDto;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**   
* 登录日志
* @author xxm  
* @date 2021/8/12 
*/
@Data
@Accessors(chain = true)
@TableName("starter_login_log")
public class LoginLog implements EntityBaseFunction<LoginLogDto> {

    @TableId(type = IdType.ASSIGN_ID)
    private Long id;

    /** 用户账号id */
    private Long userId;

    /** 用户名称 */
    private String account;

    /** 登录成功状态*/
    private boolean login;

    /** 登录终端 */
    private String client;

    /** 登录IP地址 */
    private String ip;

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

    @Override
    public LoginLogDto toDto() {
        return LogConvert.CONVERT.convert(this);
    }
}

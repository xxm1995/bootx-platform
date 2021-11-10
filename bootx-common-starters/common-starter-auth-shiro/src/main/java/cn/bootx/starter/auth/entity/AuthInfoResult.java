package cn.bootx.starter.auth.entity;

import cn.bootx.common.core.entity.UserDetail;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* 认证返回结果
* @author xxm  
* @date 2021/7/30 
*/
@Data
@Accessors(chain = true)
public class AuthInfoResult {
    /** 用户id */
    private Object id;

    /** 终端(例如web/小程序/app等) */
    private String client = "";

    /** 用户对象 */
    private UserDetail userDetail;
}

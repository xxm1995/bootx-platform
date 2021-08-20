package cn.bootx.iam.exception.user;


import cn.bootx.common.core.exception.FatalException;

import static cn.bootx.iam.code.UcErrorCodes.USER_INFO_NOT_EXISTS;


/**   
* 用户信息不存在异常
* @author xxm  
* @date 2020/5/7 18:29
*/
public class UserInfoNotExistsException extends FatalException {
    public UserInfoNotExistsException() {
        super(USER_INFO_NOT_EXISTS, "用户信息不存在");
    }
}

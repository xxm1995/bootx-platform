package cn.bootx.iam.exception.permission;


import cn.bootx.common.core.exception.BizException;

import java.io.Serializable;

import static cn.bootx.iam.code.UcErrorCodes.PERMISSION_DB_ERROR;


/**
* @author xxm
* @date 2020/5/7 18:01
*/
public class PermissionDBErrorException extends BizException implements Serializable {

    private static final long serialVersionUID = -2698918595713722011L;

    public PermissionDBErrorException() {
        super(PERMISSION_DB_ERROR, "用户没有权限.");
    }
}

package cn.bootx.iam.exception.role;


import cn.bootx.common.core.exception.BizException;

import java.io.Serializable;

import static cn.bootx.iam.code.UcErrorCodes.ROLE_NOT_EXISTED;

/**
 * 角色不存在
* @author xxm
* @date 2020/5/7 18:04
*/
public class RoleNotExistedException extends BizException implements Serializable {
    private static final long serialVersionUID = -6651799569179960110L;

    public RoleNotExistedException() {
        super(ROLE_NOT_EXISTED, "角色不存在.");
    }
}

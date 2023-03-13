package cn.bootx.starter.auth.exception;

import cn.bootx.common.core.exception.BizException;

/**
 * 登录方式不存在
 *
 * @author xxm
 * @date 2022/11/6
 */
public class LonginTypeNotFoundException extends BizException {

    public LonginTypeNotFoundException() {
        super("未找到对应的登录方式");
    }

}

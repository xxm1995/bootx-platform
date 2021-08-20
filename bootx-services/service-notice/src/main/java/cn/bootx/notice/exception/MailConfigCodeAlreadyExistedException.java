package cn.bootx.notice.exception;

import cn.bootx.common.core.exception.BizException;

import java.io.Serializable;

import static cn.bootx.notice.code.NoticeCenterErrorCode.MAIL_CONFIG_CODE_ALREADY_EXISTED;

/**
* 邮箱配置编号 已存在异常
* @author xxm
* @date 2020/5/2 14:12
*/
public class MailConfigCodeAlreadyExistedException extends BizException implements Serializable {

    private static final long serialVersionUID = 6572063368550031815L;

    public MailConfigCodeAlreadyExistedException() {
        super(MAIL_CONFIG_CODE_ALREADY_EXISTED, "邮箱配置编号 已存在异常");
    }
}

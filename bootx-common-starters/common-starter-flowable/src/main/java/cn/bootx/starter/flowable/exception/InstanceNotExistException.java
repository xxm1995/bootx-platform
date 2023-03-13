package cn.bootx.starter.flowable.exception;

import cn.bootx.common.core.exception.BizException;

/**
 * 流程实例不存在
 *
 * @author xxm
 * @date 2020/3/1 15:28
 */
public class InstanceNotExistException extends BizException {

    public InstanceNotExistException(String message) {
        super(message);
    }

    public InstanceNotExistException() {
        super("流程实例不存在");
    }

}

package cn.bootx.starter.flowable.exception;

import cn.bootx.common.core.exception.BizException;

/**
 * 流程模型节点定义不存在
 *
 * @author xxm
 * @date 2022/9/4
 */
public class ModelNodeNotExistException extends BizException {

    public ModelNodeNotExistException() {
        super("流程模型节点定义不存在");
    }

}

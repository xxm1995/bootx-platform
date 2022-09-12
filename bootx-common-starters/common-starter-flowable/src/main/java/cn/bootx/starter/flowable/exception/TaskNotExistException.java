package cn.bootx.starter.flowable.exception;


import cn.bootx.common.core.exception.BizException;

/**   
 * 流程任务不存在
 * @author xxm  
 * @date 2022/9/12 
 */
public class TaskNotExistException extends BizException {
    public TaskNotExistException(String message) {
        super(message);
    }

    public TaskNotExistException() {
        super("流程任务不存在");
    }
}

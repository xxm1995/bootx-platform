package cn.bootx.starter.flowable.local;

import cn.bootx.common.core.entity.UserDetail;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.util.Map;
import java.util.Optional;

/**
 * 流程处理时上下文
 * @author xxm
 * @date 2022/8/28
 */
@Getter
@Setter
@Accessors(chain = true)
public class BpmContext {

    /** 流程模型id */
    private Long modelId;

    /** 提交的表单值 */
    private Map<String,Object> formVariables;

    /** 启动任务的用户 */
    private Optional<UserDetail> startUser = Optional.empty() ;

    /** 处理任务时的审批意见 */
    private String taskReason;

    /**
     * 当前任务处理状态
     * @see cn.bootx.starter.flowable.code.TaskCode#STATE_PROCESS
     */
    private String taskState;

    /**
     * 当前任务处理结果
     * @see cn.bootx.starter.flowable.code.TaskCode#RESULT_PASS
     */
    private String taskResult;

    /**
     * 下一步执行人
     */
    private Object nextAssign;

}

package cn.bootx.starter.flowable.code;

/**
 * 流程实例的状态
 * @author xxm
 * @date 2022/8/23
 */
public interface InstanceCode {
    /** 运行中 */
    String STATE_RUNNING = "running";
    /** 已完成 */
    String STATE_FINISH = "finish";

    /** 处理中 */
    String RESULT_PROCESS = "process";
    /** 通过 */
    String RESULT_APPROVE = "approve";
    /** 不通过 */
    String RESULT_REJECT = "reject";
    /** 已取消 */
    String RESULT_CANCEL = "cancel";
}

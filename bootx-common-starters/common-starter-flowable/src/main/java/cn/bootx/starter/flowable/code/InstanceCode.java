package cn.bootx.starter.flowable.code;

/**
 * 流程实例的状态
 *
 * @author xxm
 * @date 2022/8/23
 */
public interface InstanceCode {

    /** 运行中 */
    String STATE_RUNNING = "running";

    /** 已完成 */
    String STATE_FINISH = "finish";

    /** 取消 */
    String STATE_CANCEL = "cancel";

}

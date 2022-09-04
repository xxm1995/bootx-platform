package cn.bootx.starter.flowable.code;

/**   
 * 流程任务常量
 * @author xxm  
 * @date 2022/9/4 
 */
public interface TaskCode {

    /** 处理中 */
    String STATE_PROCESS = "running";
    /** 通过 */
    String STATE_PASS = "pass";
    /** 驳回 */
    String STATE_REJECT = "reject";
    /** 退回 */
    String STATE_BACK = "back";
    /** 取回 */
    String STATE_RETRIEVE = "retrieve";
    /** 跳过 */
    String STATE_SKIP = "skip";
}

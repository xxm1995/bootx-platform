package cn.bootx.starter.flowable.code;

/**
 * 流程
 * @author xxm
 * @date 2022/9/6
 */
public interface BpmnCode {

    /** 用户任务完成标识(结束流程多实例任务的标识) */
    String USER_TASK_COMPLETION_FLAG = "${userTaskCompletionFlag}";

    /** collectionString(候选人集合) */
    String MULTI_COLLECTION = "assignees";
    /** collectionElementVariable(迭代出来的处理人) */
    String MULTI_COLLECTION_Element = "assign";

}

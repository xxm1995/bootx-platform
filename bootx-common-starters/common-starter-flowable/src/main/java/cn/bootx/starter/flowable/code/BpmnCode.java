package cn.bootx.starter.flowable.code;

/**
 * 流程
 * @author xxm
 * @date 2022/9/6
 */
public interface BpmnCode {

    /** collectionString(候选人集合) */
    String MULTI_COLLECTION = "assignees";
    /** collectionElementVariable(迭代出来的处理人) */
    String MULTI_COLLECTION_Element = "assign";

    /** 下一步标志 */
    String NEXT_NODE_FLAG = "nextNode";

}

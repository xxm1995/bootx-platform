package cn.bootx.starter.flowable.code;

/**   
 * 缓存key常量
 * @author xxm  
 * @date 2022/9/4 
 */
public interface CachingCode {

    /* 流程节点扩展 */
    /** 定义和节点id */
    String NODE_DEF_AND_NODE = "flowable:model:node:def:node";
    /** 缓存列表, 使用模型id */
    String NODE_MODEL_ID = "flowable:model:nodes:model";

}

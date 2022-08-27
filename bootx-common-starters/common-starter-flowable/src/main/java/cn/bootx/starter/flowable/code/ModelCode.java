package cn.bootx.starter.flowable.code;

/**   
 * 工作流模型代码
 * @author xxm  
 * @date 2022/8/23 
 */
public interface ModelCode{

    /** 流程定义已发布 */
    String PUBLISHED = "published";

    /** 流程定义未发布(有xml文档) */
    String UNPUBLISHED_XML = "unpublishedXml";

    /** 流程定义未发布(未上传xml文档) */
    String UNPUBLISHED = "unpublished";

}

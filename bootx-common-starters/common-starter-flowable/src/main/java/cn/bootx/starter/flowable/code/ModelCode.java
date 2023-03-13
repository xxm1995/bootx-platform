package cn.bootx.starter.flowable.code;

/**
 * 工作流模型代码
 *
 * @author xxm
 * @date 2022/8/23
 */
public interface ModelCode {

    /** 流程定义已发布 */
    String PUBLISHED = "published";

    /** 流程定义未发布 */
    String UNPUBLISHED = "unpublished";

    /** 默认的bpmn20.xml */
    String DEFAULT_XML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
            + "<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n"
            + "  <process id=\"{}\" name=\"{}\" />\n" + "  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n"
            + "    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"process_09um68mi\" />\n"
            + "  </bpmndi:BPMNDiagram>\n" + "</definitions>";

}

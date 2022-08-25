package cn.bootx.office.core.model.service;

import cn.bootx.office.core.model.dao.BpmModelManager;
import cn.bootx.office.core.model.entity.BpmModel;
import cn.bootx.starter.flowable.exception.ModelNotExistException;
import cn.bootx.starter.flowable.util.BpmXmlUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.FlowNode;
import org.flowable.bpmn.model.Process;
import org.springframework.stereotype.Service;

import java.util.List;

/**   
 *
 * @author xxm  
 * @date 2022/8/25 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmModelTaskService {
    private final BpmModelManager bpmModelManager;

    /**
     * 查询流程定义各节点
     * 后期需要修改成根据不同节点做不同的处理
     */
    public List<FlowNode> getFlowNodes(Long id){
        BpmModel bpmModel = bpmModelManager.findById(id).orElseThrow(ModelNotExistException::new);

        String modelEditorXml = bpmModel.getModelEditorXml();
        BpmnModel bpmnModel = BpmXmlUtil.convertByte2BpmnModel(modelEditorXml.getBytes());
        Process process = bpmnModel.getMainProcess();
        return process.findFlowElementsOfType(FlowNode.class);
    }

    /**
     * 同步节点
     */
    public void sync(Long id){
        // bpmn中有列表没有的添加, 双方都有的不动

        // bpmn中没有列表有的删除
    }
}

package cn.bootx.office.core.model.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.office.core.model.dao.FlowModelManager;
import cn.bootx.office.core.model.entity.FlowModel;
import cn.bootx.office.param.model.BpmModelParam;
import cn.bootx.starter.flowable.util.BpmXmlUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.Process;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.DeploymentBuilder;
import org.flowable.engine.repository.ProcessDefinition;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

import static cn.bootx.office.code.ModelCode.PUBLISH_FALSE;
import static cn.bootx.office.code.ModelCode.PUBLISH_TRUE;

/**   
 * 流程模型
 * @author xxm  
 * @date 2022/8/23 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmModelService {

    private final RepositoryService repositoryService;
    private final FlowModelManager flowModelManager;

    /**
     * 创建模型
     */
    public void add(BpmModelParam bpmModelParam, byte[] bytes){
        BpmnModel bpmnModel = BpmXmlUtils.convertByte2BpmnModel(bytes);
        Process mainProcess = bpmnModel.getMainProcess();
        FlowModel flowModel = new FlowModel()
                .setMainProcess(false)
                .setTypeKey(bpmModelParam.getTypeKey())
                .setPublish(PUBLISH_FALSE)
                .setEnable(false)
                .setModelEditorXml(BpmXmlUtils.convertBpmnModel2Str(bpmnModel))
                .setDefKey(mainProcess.getId())
                .setName(mainProcess.getName())
                .setRemark(mainProcess.getDocumentation());
        flowModelManager.save(flowModel);
    }

    /**
     * 发布流程
     * @param id
     */
    @Transactional(rollbackFor = Exception.class)
    public void publish(Long id){
        FlowModel flowModel = flowModelManager.findById(id).orElseThrow(() -> new DataNotExistException(""));
        if (Objects.equals(flowModel.getPublish(), PUBLISH_TRUE)){
            throw new RuntimeException("流程模型已经发布");
        }
        //部署
        DeploymentBuilder deploymentBuilder = repositoryService.createDeployment();

        Deployment deploy = deploymentBuilder.name(flowModel.getName())
                // 文件后缀名有要求
                .addString(flowModel.getName()+".bpmn", flowModel.getModelEditorXml())
                .key(flowModel.getDefKey())
                .category(flowModel.getTypeKey())
                .deploy();
        //流程定义
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
                .deploymentId(deploy.getId())
                .singleResult();
        //回填属性
        flowModel.setDeployId(deploy.getId())
                .setMainProcess(true)
                .setPublish(PUBLISH_TRUE)
                .setEnable(true)
                .setDefId(processDefinition.getId())
                .setProcessVersion(processDefinition.getVersion());
        flowModelManager.cancelMainProcessByDefKey(flowModel.getDefId());
        flowModelManager.updateById(flowModel);

    }

    /**
     * 删除
     * @param id
     */
    @Transactional(rollbackFor = Exception.class)
    public void remove(Long id){
        FlowModel flowModel = flowModelManager.findById(id).orElseThrow(() -> new DataNotExistException(""));

        //发布状态删除
        if (Objects.equals(PUBLISH_TRUE,flowModel.getPublish())){
            // 先删除部署以及对应的流程
            repositoryService.deleteDeployment(flowModel.getDeployId(),true);
            flowModelManager.deleteById(id);
        }
        flowModelManager.deleteById(id);
    }

}

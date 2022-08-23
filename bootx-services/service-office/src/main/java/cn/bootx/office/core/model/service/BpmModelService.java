package cn.bootx.office.core.model.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.office.core.model.dao.BpmModelManager;
import cn.bootx.office.core.model.entity.BpmModel;
import cn.bootx.office.param.model.BpmModelParam;
import cn.bootx.office.param.model.FlowModelParam;
import cn.bootx.starter.flowable.exception.ModelNotExistException;
import cn.bootx.starter.flowable.util.BpmXmlUtils;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
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
    private final BpmModelManager bpmModelManager;

    /**
     * 创建模型
     */
    public void add(BpmModelParam bpmModelParam, byte[] bytes){
        BpmnModel bpmnModel = BpmXmlUtils.convertByte2BpmnModel(bytes);
        Process mainProcess = bpmnModel.getMainProcess();
        BpmModel flowBpmModel = new BpmModel()
                .setName(bpmModelParam.getName())
                .setModelType(bpmModelParam.getModelType())
                .setMainProcess(false)
                .setPublish(PUBLISH_FALSE)
                .setEnable(false)
                .setModelEditorXml(BpmXmlUtils.convertBpmnModel2Str(bpmnModel))
                .setDefKey(mainProcess.getId())
                .setDefName(mainProcess.getName())
                .setRemark(mainProcess.getDocumentation());
        bpmModelManager.save(flowBpmModel);
    }

    /**
     * 修改
     */
    public void update(FlowModelParam param){
        BpmModel flowBpmModel = bpmModelManager.findById(param.getId()).orElseThrow(ModelNotExistException::new);

        BeanUtil.copyProperties(param, flowBpmModel, CopyOptions.create().ignoreNullValue());
        bpmModelManager.updateById(flowBpmModel);
    }

    /**
     * 发布流程
     */
    @Transactional(rollbackFor = Exception.class)
    public void publish(Long id){
        BpmModel flowBpmModel = bpmModelManager.findById(id).orElseThrow(ModelNotExistException::new);

        if (Objects.equals(flowBpmModel.getPublish(), PUBLISH_TRUE)){
            throw new BizException("流程模型已经发布");
        }
        //部署
        DeploymentBuilder deploymentBuilder = repositoryService.createDeployment();

        Deployment deploy = deploymentBuilder.name(flowBpmModel.getName())
                // 文件后缀名有要求
                .addString(flowBpmModel.getName()+".bpmn", flowBpmModel.getModelEditorXml())
                .key(flowBpmModel.getDefKey())
                .category(flowBpmModel.getModelType())
                .deploy();
        //流程定义
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
                .deploymentId(deploy.getId())
                .singleResult();
        //回填属性
        flowBpmModel.setDeployId(deploy.getId())
                .setMainProcess(true)
                .setPublish(PUBLISH_TRUE)
                .setEnable(true)
                .setDefId(processDefinition.getId())
                .setProcessVersion(processDefinition.getVersion());
        bpmModelManager.cancelMainProcessByDefKey(flowBpmModel.getDefId());
        bpmModelManager.updateById(flowBpmModel);

    }

    /**
     * 删除
     * @param id
     */
    @Transactional(rollbackFor = Exception.class)
    public void remove(Long id){
        BpmModel flowBpmModel = bpmModelManager.findById(id).orElseThrow(() -> new DataNotExistException(""));

        //发布状态删除
        if (Objects.equals(PUBLISH_TRUE, flowBpmModel.getPublish())){
            // 先删除部署以及对应的流程
            repositoryService.deleteDeployment(flowBpmModel.getDeployId(),true);
            bpmModelManager.deleteById(id);
        }
        bpmModelManager.deleteById(id);
    }

}

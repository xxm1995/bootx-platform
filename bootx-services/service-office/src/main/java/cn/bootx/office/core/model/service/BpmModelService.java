package cn.bootx.office.core.model.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.office.core.model.dao.BpmModelManager;
import cn.bootx.office.core.model.entity.BpmModel;
import cn.bootx.office.dto.model.BpmModelDto;
import cn.bootx.office.param.model.BpmModelParam;
import cn.bootx.office.param.model.FlowModelParam;
import cn.bootx.starter.flowable.exception.ModelNotExistException;
import cn.bootx.starter.flowable.util.BpmXmlUtil;
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

import static cn.bootx.office.code.ModelCode.*;

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
     * 创建模型 并上传BPMN文件
     */
    public void addAndUploadBpmn(BpmModelParam bpmModelParam, byte[] bytes){
        BpmnModel bpmnModel = BpmXmlUtil.convertByte2BpmnModel(bytes);
        Process mainProcess = bpmnModel.getMainProcess();
        BpmModel flowBpmModel = new BpmModel()
                .setName(bpmModelParam.getName())
                .setModelType(bpmModelParam.getModelType())
                .setMainProcess(false)
                .setPublish(UNPUBLISHED)
                .setEnable(false)
                .setModelEditorXml(BpmXmlUtil.convertBpmnModel2Str(bpmnModel))
                .setDefKey(mainProcess.getId())
                .setDefName(mainProcess.getName())
                .setDefRemark(mainProcess.getDocumentation())
                .setRemark(bpmModelParam.getRemark());
        bpmModelManager.save(flowBpmModel);
    }

    /**
     * 创建模型
     */
    public void add(BpmModelParam bpmModelParam){
        BpmModel flowBpmModel = new BpmModel()
                .setName(bpmModelParam.getName())
                .setModelType(bpmModelParam.getModelType())
                .setMainProcess(false)
                .setPublish(UNPUBLISHED)
                .setEnable(false)
                .setRemark(bpmModelParam.getRemark());
        bpmModelManager.save(flowBpmModel);
    }

    /**
     * 上传bpm文件
     */
    public void uploadBpmn(Long id,byte[] bytes){
        BpmModel bpmModel = bpmModelManager.findById(id).orElseThrow(ModelNotExistException::new);
        BpmnModel bpmnModel = BpmXmlUtil.convertByte2BpmnModel(bytes);
        Process mainProcess = bpmnModel.getMainProcess();
        bpmModel.setModelEditorXml(BpmXmlUtil.convertBpmnModel2Str(bpmnModel))
                .setPublish(UNPUBLISHED_XML)
                .setDefKey(mainProcess.getId())
                .setDefName(mainProcess.getName())
                .setDefRemark(mainProcess.getDocumentation());
        bpmModelManager.updateById(bpmModel);
    }

    /**
     * 修改
     */
    public void update(BpmModelParam param){
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

        if (Objects.equals(flowBpmModel.getPublish(), PUBLISHED)){
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
                .setPublish(PUBLISHED)
                .setEnable(true)
                .setDefId(processDefinition.getId())
                .setProcessVersion(processDefinition.getVersion());
        bpmModelManager.cancelMainProcessByDefKey(flowBpmModel.getDefKey());
        bpmModelManager.updateById(flowBpmModel);

    }

    /**
     * 删除
     */
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id){
        BpmModel flowBpmModel = bpmModelManager.findById(id).orElseThrow(() -> new DataNotExistException(""));

        //发布状态删除
        if (Objects.equals(PUBLISHED, flowBpmModel.getPublish())){
            // 先删除部署以及对应的流程
            repositoryService.deleteDeployment(flowBpmModel.getDeployId(),true);
            bpmModelManager.deleteById(id);
        }
        bpmModelManager.deleteById(id);
    }

    /**
     * 分页
     */
    public PageResult<BpmModelDto> page(PageParam pageParam, FlowModelParam flowModelParam){
        return MpUtil.convert2DtoPageResult(bpmModelManager.page(pageParam,flowModelParam));
    }

    /**
     * 获取单条
     */
    public BpmModelDto findById(Long id){
        return bpmModelManager.findById(id).map(BpmModel::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 校验流程
     */
    public void verifyModel(){
        // 校验是否有xml文档

        // 校验对应的任务节点是否已经被配置
    }
}

package cn.bootx.starter.flowable.core.model.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.dto.LabelValue;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.starter.flowable.core.model.dao.BpmModelManager;
import cn.bootx.starter.flowable.core.model.dao.BpmModelTaskManager;
import cn.bootx.starter.flowable.core.model.entity.BpmModel;
import cn.bootx.starter.flowable.core.model.entity.BpmModelTask;
import cn.bootx.starter.flowable.dto.model.BpmModelDto;
import cn.bootx.starter.flowable.exception.ModelNotExistException;
import cn.bootx.starter.flowable.param.model.BpmModelParam;
import cn.bootx.starter.flowable.util.BpmXmlUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.Process;
import org.flowable.bpmn.model.UserTask;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.DeploymentBuilder;
import org.flowable.engine.repository.ProcessDefinition;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import static cn.bootx.starter.flowable.code.ModelCode.*;

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
    private final BpmModelTaskManager bpmModelTaskManager;

    /**
     * 创建模型
     */
    public void add(BpmModelParam bpmModelParam){
        BpmModel bpmModel = new BpmModel()
                .setName(bpmModelParam.getName())
                .setModelType(bpmModelParam.getModelType())
                .setMainProcess(false)
                .setPublish(UNPUBLISHED)
                .setModelEditorXml(DEFAULT_XML)
                .setEnable(false)
                .setRemark(bpmModelParam.getRemark());
        bpmModelManager.save(bpmModel);
    }

    /**
     * 上传bpm文件
     */
    public void uploadBpmn(BpmModelParam bpmModelParam){
        String modelEditorXml = bpmModelParam.getModelEditorXml();
        BpmModel bpmModel = bpmModelManager.findById(bpmModelParam.getId()).orElseThrow(ModelNotExistException::new);
        bpmModel.setModelEditorXml(modelEditorXml);
        bpmModelManager.updateById(bpmModel);
    }

    /**
     * 复制
     */
    @Transactional(rollbackFor = Exception.class)
    public void copy(Long id){
        BpmModel bpmModel = bpmModelManager.findById(id).orElseThrow(ModelNotExistException::new);
        BpmModel newBpmModel = new BpmModel()
                .setName(bpmModel.getName())
                .setModelType(bpmModel.getModelType())
                .setMainProcess(false)
                .setPublish(UNPUBLISHED)
                .setModelEditorXml(bpmModel.getModelEditorXml())
                .setEnable(false)
                .setRemark(bpmModel.getRemark());
        bpmModelManager.save(newBpmModel);
        List<BpmModelTask> bpmModelTasks = bpmModelTaskManager.findAllByModelId(id);

        List<BpmModelTask> newModelTasks = bpmModelTasks.stream()
                .map(bpmModelTask -> new BpmModelTask()
                        .setModelId(newBpmModel.getId())
                        .setTaskName(bpmModelTask.getTaskName())
                        .setFormId(bpmModelTask.getFormId())
                        .setAssignType(bpmModelTask.getAssignType())
                        .setUserId(bpmModelTask.getUserId())
                        .setUserName(bpmModelTask.getUserName())
                ).collect(Collectors.toList());
        bpmModelTaskManager.saveAll(newModelTasks);
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
        BpmModel bpmModel = bpmModelManager.findById(id).orElseThrow(ModelNotExistException::new);

        // 校验检查
        this.verifyModel(bpmModel);
        //部署
        DeploymentBuilder deploymentBuilder = repositoryService.createDeployment();

        Deployment deploy = deploymentBuilder.name(bpmModel.getName())
                // 文件后缀名有要求
                .addString(bpmModel.getName()+".bpmn", bpmModel.getModelEditorXml())
                .key(bpmModel.getDefKey())
                .category(bpmModel.getModelType())
                .deploy();
        //流程定义
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery()
                .deploymentId(deploy.getId())
                .singleResult();
        //回填属性
        bpmModel.setDeployId(deploy.getId())
                .setDefId(processDefinition.getId())
                .setDefKey(processDefinition.getKey())
                .setDefName(processDefinition.getName())
                .setDefRemark(processDefinition.getDescription())
                .setMainProcess(true)
                .setPublish(PUBLISHED)
                .setEnable(true)
                .setProcessVersion(processDefinition.getVersion());
        bpmModelManager.cancelMainProcessByDefKey(bpmModel.getDefKey());
        bpmModelManager.updateById(bpmModel);
        this.updateTaskNodes(bpmModel);
    }

    /**
     * 删除
     */
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id){
        BpmModel flowBpmModel = bpmModelManager.findById(id).orElseThrow(() -> new DataNotExistException(""));

        //发布状态删除
        if (Objects.equals(PUBLISHED, flowBpmModel.getPublish())){
            throw new BizException("流程已发布, 无法删除");
            // 先删除部署以及对应的流程
//            repositoryService.deleteDeployment(flowBpmModel.getDeployId(),true);
//            bpmModelManager.deleteById(id);
        }
        bpmModelTaskManager.deleteByModelId(id);
        bpmModelManager.deleteById(id);
    }

    /**
     * 分页
     */
    public PageResult<BpmModelDto> page(PageParam pageParam, BpmModelParam bpmModelParam){
        return MpUtil.convert2DtoPageResult(bpmModelManager.page(pageParam,bpmModelParam));
    }

    /**
     * 获取单条
     */
    public BpmModelDto findById(Long id){
        return bpmModelManager.findById(id).map(BpmModel::toDto).orElseThrow(ModelNotExistException::new);
    }

    /**
     * 根据流程定义id获取模型信息
     */
    public BpmModelDto findByDefId(String defId){
        return bpmModelManager.findByDefId(defId).map(BpmModel::toDto).orElseThrow(ModelNotExistException::new);
    }

    /**
     * 获取生效并部署的主流程列表
     */
    public List<LabelValue> findMainProcess(){
        return bpmModelManager.findMainProcess().stream()
                .map(bpmModel -> new LabelValue(bpmModel.getName(),bpmModel.getId()))
                .collect(Collectors.toList());
    }

    /**
     * 更新关联任务节点信息
     */
    private void updateTaskNodes(BpmModel bpmModel){
        bpmModelTaskManager.lambdaUpdate()
                .set(BpmModelTask::getDefId,bpmModel.getDefId())
                .set(BpmModelTask::getDefKey, bpmModel.getDefKey())
                .eq(BpmModelTask::getModelId,bpmModel.getId())
                .update();
    }

    /**
     * 发布前校验流程
     */
    public void verifyModel(BpmModel bpmModel){
        // 校验是否已经发布
        if (Objects.equals(bpmModel.getPublish(), PUBLISHED)){
            throw new BizException("流程模型已经发布");
        }

        // 校验对应的任务节点是否已经被配置
        String modelEditorXml = bpmModel.getModelEditorXml();
        BpmnModel bpmnModel = BpmXmlUtil.convertByte2BpmnModel(modelEditorXml.getBytes());
        Process process = bpmnModel.getMainProcess();
        List<UserTask> userTasks = process.findFlowElementsOfType(UserTask.class);
        List<BpmModelTask> bpmModelTasks = bpmModelTaskManager.findAllByModelId(bpmModel.getId());

        val bpmModelTaskMap = bpmModelTasks.stream().collect(Collectors.toMap(BpmModelTask::getTaskId, o->o));

        for (val userTask : userTasks) {
            BpmModelTask modelTask = bpmModelTaskMap.get(userTask.getId());
            if (Objects.isNull(modelTask)){
                throw new BizException("流程有任务节点未进行配置，请进行配置");
            }
            if (StrUtil.isBlank(modelTask.getAssignType())){
                throw new BizException(modelTask.getTaskName() + " 任务节点未配置处理人员类型");
            }
        }
    }
}

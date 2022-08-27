package cn.bootx.starter.flowable.core.model.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.starter.flowable.core.model.dao.BpmModelManager;
import cn.bootx.starter.flowable.core.model.dao.BpmModelTaskManager;
import cn.bootx.starter.flowable.core.model.entity.BpmModel;
import cn.bootx.starter.flowable.core.model.entity.BpmModelTask;
import cn.bootx.starter.flowable.dto.model.BpmModelTaskDto;
import cn.bootx.starter.flowable.param.model.BpmModelTaskParam;
import cn.bootx.starter.flowable.exception.ModelNotExistException;
import cn.bootx.starter.flowable.util.BpmXmlUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.Process;
import org.flowable.bpmn.model.UserTask;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

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
    private final BpmModelTaskManager bpmModelTaskManager;

    /**
     * 添加
     */
    public void add(BpmModelTaskParam param){
        BpmModelTask bpmModelTask = BpmModelTask.init(param);
        bpmModelTaskManager.save(bpmModelTask);
    }

    /**
     * 修改
     */
    public void update(BpmModelTaskParam param){
        BpmModelTask bpmModelTask = bpmModelTaskManager.findById(param.getId()).orElseThrow(DataNotExistException::new);

        BeanUtil.copyProperties(param,bpmModelTask, CopyOptions.create().ignoreNullValue());
        bpmModelTaskManager.updateById(bpmModelTask);
    }

    /**
     * 获取单条
     */
    public BpmModelTaskDto findById(Long id){
        return bpmModelTaskManager.findById(id).map(BpmModelTask::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取全部
     */
    public List<BpmModelTaskDto> findAllByModelId(Long modelId){
        return ResultConvertUtil.dtoListConvert(bpmModelTaskManager.findAllByModelId(modelId));
    }

    /**
     * 删除
     */
    public void delete(Long id){
        bpmModelTaskManager.deleteById(id);
    }

    /**
     * 同步节点
     */
    @Transactional(rollbackFor = Exception.class)
    public void sync(Long modelId){
        // 已经配置的
        List<BpmModelTask> taskNodes = bpmModelTaskManager.findAll();
        List<String> taskNodeTaskIds = taskNodes.stream().map(BpmModelTask::getTaskId).collect(Collectors.toList());
        // bpmn文件中的
        List<BpmModelTask> flowNodes = this.getFlowNodes(modelId);
        List<String> flowNodeTaskIds = flowNodes.stream().map(BpmModelTask::getTaskId).collect(Collectors.toList());
        // bpmn中有列表没有的添加, 双方都有的不动
        List<BpmModelTask> saves = flowNodes.stream()
                .filter(o -> !taskNodeTaskIds.contains(o.getTaskId()))
                .peek(o -> o.setModelId(modelId))
                .collect(Collectors.toList());

        // bpmn中没有列表有的删除
        List<Long> deleteIds = taskNodes.stream()
                .filter(o -> !flowNodeTaskIds.contains(o.getTaskId()))
                .map(MpIdEntity::getId)
                .collect(Collectors.toList());
        bpmModelTaskManager.saveAll(saves);
        bpmModelTaskManager.deleteByIds(deleteIds);
    }

    /**
     * 查询流程定义各节点
     * 后期需要修改成根据不同节点做不同的处理
     */
    private List<BpmModelTask> getFlowNodes(Long id){
        BpmModel bpmModel = bpmModelManager.findById(id).orElseThrow(ModelNotExistException::new);

        String modelEditorXml = bpmModel.getModelEditorXml();
        BpmnModel bpmnModel = BpmXmlUtil.convertByte2BpmnModel(modelEditorXml.getBytes());
        Process process = bpmnModel.getMainProcess();
        List<UserTask> userTasks = process.findFlowElementsOfType(UserTask.class);
        return userTasks.stream()
                .map(userTask -> new BpmModelTask()
                        .setModelId(id)
                        .setDefId(bpmModel.getDefId())
                        .setDefKey(bpmModel.getDefKey())
                        .setTaskId(userTask.getId())
                        .setTaskName(userTask.getName())
                ).collect(Collectors.toList());

    }
}

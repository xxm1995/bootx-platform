package cn.bootx.starter.flowable.core.model.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.starter.flowable.core.model.dao.BpmModelManager;
import cn.bootx.starter.flowable.core.model.dao.BpmModelNodeManager;
import cn.bootx.starter.flowable.core.model.entity.BpmModel;
import cn.bootx.starter.flowable.core.model.entity.BpmModelNode;
import cn.bootx.starter.flowable.dto.model.BpmModelNodeDto;
import cn.bootx.starter.flowable.param.model.BpmModelNodeParam;
import cn.bootx.starter.flowable.exception.ModelNotExistException;
import cn.bootx.starter.flowable.util.BpmXmlUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.bpmn.model.Process;
import org.flowable.bpmn.model.UserTask;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

import static cn.bootx.starter.flowable.code.CachingCode.NODE_MODEL_ID;

/**   
 * 模型任务节点服务
 * @author xxm  
 * @date 2022/8/25 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmModelNodeService {
    private final BpmModelManager bpmModelManager;
    private final BpmModelNodeManager bpmModelNodeManager;

    /**
     * 添加
     */
    @CacheEvict(value = NODE_MODEL_ID,key = "#param.modelId")
    public void add(BpmModelNodeParam param){
        BpmModelNode bpmModelNode = BpmModelNode.init(param);
        bpmModelNodeManager.save(bpmModelNode);
    }

    /**
     * 修改
     */
    @CacheEvict(value = NODE_MODEL_ID, key = "#param.modelId")
    public void update(BpmModelNodeParam param){
        BpmModelNode bpmModelNode = bpmModelNodeManager.findById(param.getId()).orElseThrow(DataNotExistException::new);

        BeanUtil.copyProperties(param, bpmModelNode, CopyOptions.create().ignoreNullValue());
        bpmModelNodeManager.updateById(bpmModelNode);
    }

    /**
     * 获取单条
     */
    public BpmModelNodeDto findById(Long id){
        return bpmModelNodeManager.findById(id).map(BpmModelNode::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 获取全部
     */
    public List<BpmModelNodeDto> findAllByModelId(Long modelId){
        return ResultConvertUtil.dtoListConvert(bpmModelNodeManager.findAllByModelId(modelId));
    }

    /**
     * 删除
     */
    @CacheEvict(value = NODE_MODEL_ID, allEntries = true)
    public void delete(Long id){
        bpmModelNodeManager.deleteById(id);
    }

    /**
     * 同步节点
     */
    @Transactional(rollbackFor = Exception.class)
    @CacheEvict(value = NODE_MODEL_ID,key = "#modelId")
    public void sync(Long modelId){
        // 已经配置的
        List<BpmModelNode> taskNodes = bpmModelNodeManager.findAllByModelId(modelId);
        List<String> taskNodeTaskIds = taskNodes.stream().map(BpmModelNode::getNodeId).collect(Collectors.toList());
        // bpmn文件中的
        List<BpmModelNode> flowNodes = this.getFlowNodes(modelId);
        List<String> flowNodeTaskIds = flowNodes.stream().map(BpmModelNode::getNodeId).collect(Collectors.toList());
        // bpmn中有列表没有的添加, 双方都有的不动
        List<BpmModelNode> saves = flowNodes.stream()
                .filter(o -> !taskNodeTaskIds.contains(o.getNodeId()))
                .peek(o -> o.setModelId(modelId))
                .collect(Collectors.toList());

        // bpmn中没有列表有的删除
        List<Long> deleteIds = taskNodes.stream()
                .filter(o -> !flowNodeTaskIds.contains(o.getNodeId()))
                .map(MpIdEntity::getId)
                .collect(Collectors.toList());
        bpmModelNodeManager.saveAll(saves);
        bpmModelNodeManager.deleteByIds(deleteIds);
    }

    /**
     * 查询流程定义各节点
     * 后期需要修改成根据不同节点做不同的处理
     */
    private List<BpmModelNode> getFlowNodes(Long id){
        BpmModel bpmModel = bpmModelManager.findById(id).orElseThrow(ModelNotExistException::new);

        String modelEditorXml = bpmModel.getModelEditorXml();
        BpmnModel bpmnModel = BpmXmlUtil.convertByte2BpmnModel(modelEditorXml.getBytes());
        Process process = bpmnModel.getMainProcess();
        List<UserTask> userTasks = process.findFlowElementsOfType(UserTask.class);
        return userTasks.stream()
                .map(userTask -> new BpmModelNode()
                        .setModelId(id)
                        .setDefId(bpmModel.getDefId())
                        .setDefKey(bpmModel.getDefKey())
                        .setNodeId(userTask.getId())
                        .setTaskName(userTask.getName())
                ).collect(Collectors.toList());

    }
}

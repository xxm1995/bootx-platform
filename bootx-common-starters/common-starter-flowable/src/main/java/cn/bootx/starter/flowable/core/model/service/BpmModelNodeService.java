package cn.bootx.starter.flowable.core.model.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.util.CollUtil;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.starter.flowable.core.model.dao.BpmModelManager;
import cn.bootx.starter.flowable.core.model.dao.BpmModelNodeManager;
import cn.bootx.starter.flowable.core.model.entity.BpmModel;
import cn.bootx.starter.flowable.core.model.entity.BpmModelNode;
import cn.bootx.starter.flowable.dto.model.BpmModelNodeDto;
import cn.bootx.starter.flowable.exception.ModelNotExistException;
import cn.bootx.starter.flowable.param.model.BpmModelNodeParam;
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
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

import static cn.bootx.starter.flowable.code.CachingCode.NODE_MODEL_ID;
import static cn.bootx.starter.flowable.code.ModelNodeCode.ASSIGN_SELECT;
import static cn.bootx.starter.flowable.code.ModelNodeCode.ASSIGN_SPONSOR;

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

    private final List<String> nodeAssignTypes = CollUtil.toList(ASSIGN_SPONSOR,ASSIGN_SELECT);
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

        // 预防脏数据
        if (nodeAssignTypes.contains(bpmModelNode.getAssignType())){
            bpmModelNode.setAssignRaw(null);
            bpmModelNode.setAssignShow(null);
        }

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
        List<String> taskNodeIds = taskNodes.stream().map(BpmModelNode::getNodeId).collect(Collectors.toList());
        // bpmn文件中的
        List<BpmModelNode> flowNodes = this.getFlowNodes(modelId);
        List<String> flowNodeIds = flowNodes.stream().map(BpmModelNode::getNodeId).collect(Collectors.toList());
        Map<String, BpmModelNode> flowNodeMap = flowNodes.stream().collect(Collectors.toMap(BpmModelNode::getNodeId, o -> o));
        // bpmn中有列表没有的添加, 双方都有的不动
        List<BpmModelNode> saves = flowNodes.stream()
                .filter(o -> !taskNodeIds.contains(o.getNodeId()))
                .peek(o -> o.setModelId(modelId))
                .collect(Collectors.toList());

        // bpmn中没有列表有的删除
        List<Long> deleteIds = taskNodes.stream()
                .filter(o -> !flowNodeIds.contains(o.getNodeId()))
                .map(MpIdEntity::getId)
                .collect(Collectors.toList());
        // 双方都有的查看数据是否需要更新
        List<BpmModelNode> updates = taskNodes.stream()
                .filter(taskNode -> flowNodeIds.contains(taskNode.getNodeId()))
                .filter(taskNode -> {
                    BpmModelNode node = flowNodeMap.get(taskNode.getNodeId());
                    // 注意, 这里对任务做了处理
                    return comparisonAndUpdateNodeAttr(node,taskNode);
                }).collect(Collectors.toList());
        bpmModelNodeManager.saveAll(saves);
        bpmModelNodeManager.updateAllById(updates);
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
                .map(userTask -> convert(userTask,bpmModel))
                .collect(Collectors.toList());
    }

    /**
     * 比较节点属性并更新任务节点不一致的属性
     * @return  是否进行了处理
     */
    private boolean comparisonAndUpdateNodeAttr(BpmModelNode node, BpmModelNode userTask){
        boolean flag = false;
        // 名称
        if (!StrUtil.equals(node.getNodeName(),userTask.getNodeName())){
            userTask.setNodeName(node.getNodeName());
            flag = true;
        }
        // 是否多任务
        if (node.isMulti() != userTask.isMulti()){
            userTask.setMulti(node.isMulti());
            flag = true;
        }
        return flag;
    }

    /**
     * 节点转换
     * @param userTask
     * @param bpmModel
     * @return
     */
    public BpmModelNode convert(UserTask userTask, BpmModel bpmModel){
        BpmModelNode modelNode = new BpmModelNode()
                .setModelId(bpmModel.getId())
                .setDefId(bpmModel.getDefId())
                .setDefKey(bpmModel.getDefKey())
                .setNodeId(userTask.getId())
                .setNodeName(userTask.getName());
        // 多实例(循环任务)处理
        val loopCharacteristics = userTask.getLoopCharacteristics();
        if (Objects.nonNull(loopCharacteristics)){
            modelNode.setMulti(true);
        }
        return modelNode;
    }
}

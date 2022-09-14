package cn.bootx.starter.flowable.core.model.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.starter.flowable.core.model.entity.BpmModelNode;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

import static cn.bootx.starter.flowable.code.CachingCode.*;

/**
 * 模型任务节点配置
 * @author xxm
 * @date 2022-08-25
 */
@Repository
@RequiredArgsConstructor
public class BpmModelNodeManager extends BaseManager<BpmModelNodeMapper, BpmModelNode> {


    /**
     * 根据ModelId查询
     */
    @Cacheable(value = NODE_MODEL_ID, key = "#modelId")
    public List<BpmModelNode> findAllByModelId(Long modelId) {
        return findAllByField(BpmModelNode::getModelId,modelId);
    }

    /**
     * 查询任务节点配置项
     *
     * @param defId  定义id
     * @param nodeId 任务节点id
     */
    @Cacheable(value = NODE_DEF_AND_NODE, key = "#defId+':'+#nodeId")
    public Optional<BpmModelNode> findByDefIdAndNodeId(String defId, String nodeId){
        return lambdaQuery()
                .eq(BpmModelNode::getDefId,defId)
                .eq(BpmModelNode::getNodeId,nodeId)
                .oneOpt();
    }

    /**
     * 根据模型id删除
     */
    public void deleteByModelId(Long modelId){
        deleteByField(BpmModelNode::getModelId,modelId);
    }

}
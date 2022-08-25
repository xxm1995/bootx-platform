package cn.bootx.office.core.model.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.office.core.model.entity.BpmModelTask;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 模型任务节点配置
 * @author xxm
 * @date 2022-08-25
 */
@Repository
@RequiredArgsConstructor
public class BpmModelTaskManager extends BaseManager<BpmModelTaskMapper, BpmModelTask> {


    /**
     * 根据ModelId查询
     */
    public List<BpmModelTask> findAllByModelId(Long modelId) {
        return findAllByField(BpmModelTask::getModelId,modelId);
    }
}
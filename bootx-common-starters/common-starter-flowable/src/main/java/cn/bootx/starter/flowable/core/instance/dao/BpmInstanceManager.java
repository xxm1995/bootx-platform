package cn.bootx.starter.flowable.core.instance.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.starter.flowable.core.instance.entity.BpmInstance;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

/**
 * 流程实例扩展
 * @author xxm
 * @date 2022-08-23
 */
@Repository
@RequiredArgsConstructor
public class BpmInstanceManager extends BaseManager<BpmInstanceMapper, BpmInstance> {

    /**
     * 根据流程实例ID查询
     */
    public Collection<BpmInstance> findAllByInstanceIds(List<String> ids) {
        return findAllByFields(BpmInstance::getInstanceId,ids);
    }

    /**
     * 根据流程id进行查询
     */
    public Optional<BpmInstance> findByInstanceId(String instanceId){
        return findByField(BpmInstance::getInstanceId,instanceId);
    }
}
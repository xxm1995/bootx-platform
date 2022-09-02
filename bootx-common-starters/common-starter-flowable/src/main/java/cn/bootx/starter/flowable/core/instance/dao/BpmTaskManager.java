package cn.bootx.starter.flowable.core.instance.dao;

import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * 流程任务扩展
 * @author xxm
 * @date 2022-08-27
 */
@Repository
@RequiredArgsConstructor
public class BpmTaskManager extends BaseManager<BpmTaskMapper, BpmTask> {


    /**
     * 根据任务id查询
     */
    public List<BpmTask> findAllByTaskIds(List<String> taskIds){
        return findAllByFields(BpmTask::getTaskId,taskIds);
    }


    /**
     * 根据实例id和任务id查询
     */
    public Optional<BpmTask> findByInstanceIdAndTaskId(String instanceId,String taskId){
        return lambdaQuery()
                .eq(BpmTask::getInstanceId,instanceId)
                .eq(BpmTask::getTaskId,taskId)
                .oneOpt();
    }

    public List<BpmTask> findAllByInstanceId(String instanceId) {
        return lambdaQuery()
                .eq(BpmTask::getInstanceId,instanceId)
                .orderByDesc(MpIdEntity::getId)
                .list();
    }
}
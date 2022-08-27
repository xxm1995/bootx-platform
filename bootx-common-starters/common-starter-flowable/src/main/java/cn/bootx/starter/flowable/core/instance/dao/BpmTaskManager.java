package cn.bootx.starter.flowable.core.instance.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * 流程任务扩展
 * @author xxm
 * @date 2022-08-27
 */
@Repository
@RequiredArgsConstructor
public class BpmTaskManager extends BaseManager<BpmTaskMapper, BpmTask> {

}
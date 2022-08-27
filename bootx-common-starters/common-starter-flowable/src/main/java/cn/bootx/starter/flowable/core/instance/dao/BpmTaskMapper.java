package cn.bootx.starter.flowable.core.instance.dao;

import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 流程任务扩展
 * @author xxm
 * @date 2022-08-27
 */
@Mapper
public interface BpmTaskMapper extends BaseMapper<BpmTask> {
}
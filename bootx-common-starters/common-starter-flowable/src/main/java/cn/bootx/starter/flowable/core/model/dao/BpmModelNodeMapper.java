package cn.bootx.starter.flowable.core.model.dao;

import cn.bootx.starter.flowable.core.model.entity.BpmModelNode;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 模型任务节点配置
 *
 * @author xxm
 * @date 2022-08-25
 */
@Mapper
public interface BpmModelNodeMapper extends BaseMapper<BpmModelNode> {

}
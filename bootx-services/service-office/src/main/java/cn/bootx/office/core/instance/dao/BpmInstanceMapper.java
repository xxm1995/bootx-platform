package cn.bootx.office.core.instance.dao;

import cn.bootx.office.core.instance.entity.BpmInstance;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 流程实例扩展
 * @author xxm
 * @date 2022-08-23
 */
@Mapper
public interface BpmInstanceMapper extends BaseMapper<BpmInstance> {
}
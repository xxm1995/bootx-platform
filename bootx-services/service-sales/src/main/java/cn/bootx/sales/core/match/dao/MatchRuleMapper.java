package cn.bootx.sales.core.match.dao;

import cn.bootx.sales.core.match.entity.MatchRuleConfig;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MatchRuleMapper extends BaseMapper<MatchRuleConfig> {
}

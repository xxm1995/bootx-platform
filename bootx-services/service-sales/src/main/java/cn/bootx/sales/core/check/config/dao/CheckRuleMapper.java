package cn.bootx.sales.core.check.config.dao;

import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**   
* 检查规则
* @author xxm  
* @date 2021/8/10 
*/
@Mapper
public interface CheckRuleMapper extends BaseMapper<CheckRuleConfig> {

}

package cn.bootx.starter.dingtalk.core.config.dao;

import cn.bootx.starter.dingtalk.core.config.entity.DingTalkConfig;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**   
*
* @author xxm  
* @date 2022/4/2 
*/
@Mapper
public interface DingTalkConfigMapper extends BaseMapper<DingTalkConfig> {
}

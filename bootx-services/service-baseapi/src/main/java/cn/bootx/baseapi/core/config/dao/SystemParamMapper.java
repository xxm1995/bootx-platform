package cn.bootx.baseapi.core.config.dao;

import cn.bootx.baseapi.core.config.entity.SystemConfig;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**   
*
* @author xxm  
* @date 2021/10/25 
*/
@Mapper
public interface SystemParamMapper extends BaseMapper<SystemConfig> {

}

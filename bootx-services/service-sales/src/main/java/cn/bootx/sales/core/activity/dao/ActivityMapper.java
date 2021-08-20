package cn.bootx.sales.core.activity.dao;

import cn.bootx.sales.core.activity.entity.Activity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**   
* 活动
* @author xxm  
* @date 2021/5/7 
*/
@Mapper
public interface ActivityMapper extends BaseMapper<Activity> {
}

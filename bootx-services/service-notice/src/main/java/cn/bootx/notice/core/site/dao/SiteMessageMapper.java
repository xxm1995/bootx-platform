package cn.bootx.notice.core.site.dao;

import cn.bootx.notice.core.site.entity.SiteMessage;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**   
* 站内信
* @author xxm  
* @date 2021/8/7 
*/
@Mapper
public interface SiteMessageMapper extends BaseMapper<SiteMessage> {
}

package cn.bootx.iam.core.client.dao;

import cn.bootx.iam.core.client.entity.Client;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**   
* 终端
* @author xxm  
* @date 2021/8/25 
*/
@Mapper
public interface ClientMapper extends BaseMapper<Client> {
}

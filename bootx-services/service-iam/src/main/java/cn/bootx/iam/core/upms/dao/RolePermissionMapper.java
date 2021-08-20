package cn.bootx.iam.core.upms.dao;

import cn.bootx.iam.core.upms.entity.RolePermission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**   
* 角色权限关系
* @author xxm  
* @date 2021/8/3 
*/
@Mapper
public interface RolePermissionMapper extends BaseMapper<RolePermission> {
}

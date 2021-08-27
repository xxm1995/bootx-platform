package cn.bootx.iam.core.permission.dao;

import cn.bootx.iam.core.permission.entity.PermissionMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**   
* 权限配置
* @author xxm  
* @date 2021/8/3 
*/
@Mapper
public interface PermissionMenuMapper extends BaseMapper<PermissionMenu> {
}

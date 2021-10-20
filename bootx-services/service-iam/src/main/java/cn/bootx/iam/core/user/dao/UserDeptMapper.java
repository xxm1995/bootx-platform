package cn.bootx.iam.core.user.dao;

import cn.bootx.iam.core.user.entity.UserDept;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**   
* 用户部门关系
* @author xxm  
* @date 2021/9/29 
*/
@Mapper
public interface UserDeptMapper extends BaseMapper<UserDept> {
}
package cn.bootx.iam.core.user.dao;

import cn.bootx.iam.core.user.entity.UserSocialLogin;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**   
* 三方登录
* @author xxm  
* @date 2021/8/2 
*/
@Mapper
public interface UserSocialLoginMapper extends BaseMapper<UserSocialLogin> {
}

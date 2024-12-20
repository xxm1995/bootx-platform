package cn.bootx.platform.iam.dao.third;

import cn.bootx.platform.iam.entity.third.UserThirdInfo;
import com.github.yulichang.base.MPJBaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户三方登录绑定详情
 *
 * @author xxm
 * @since 2022-07-02
 */
@Mapper
public interface UserThirdInfoMapper extends MPJBaseMapper<UserThirdInfo> {

}

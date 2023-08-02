package cn.bootx.platform.miniapp.core.protocol.dao;

import cn.bootx.platform.miniapp.core.protocol.entity.UserProtocol;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户协议
 * @author xxm
 * @since 2023-08-02
 */
@Mapper
public interface UserProtocolMapper extends BaseMapper<UserProtocol> {
}

package cn.bootx.platform.baseapi.core.app.dao;

import cn.bootx.platform.baseapi.core.app.entity.AppVersion;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * app版本
 *
 * @author xxm
 * @date 2021/8/9
 */
@Mapper
public interface AppVersionMapper extends BaseMapper<AppVersion> {

}

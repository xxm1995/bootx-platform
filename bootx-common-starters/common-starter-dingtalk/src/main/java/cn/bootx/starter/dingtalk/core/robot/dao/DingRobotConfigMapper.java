package cn.bootx.starter.dingtalk.core.robot.dao;

import cn.bootx.starter.dingtalk.core.robot.entity.DingRobotConfig;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 钉钉机器人配置
 *
 * @author xxm
 * @date 2021/8/5
 */
@Mapper
public interface DingRobotConfigMapper extends BaseMapper<DingRobotConfig> {

}

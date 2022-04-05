package cn.bootx.starter.dingtalk.core.robot.convert;

import cn.bootx.starter.dingtalk.core.robot.entity.DingRobotConfig;
import cn.bootx.starter.dingtalk.dto.robot.DingRobotConfigDto;
import cn.bootx.starter.dingtalk.param.robot.DingRobotConfigParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**   
* 钉钉相关类转换
* @author xxm  
* @date 2021/8/5 
*/
@Mapper
public interface DingRobotConvert {
    DingRobotConvert CONVERT = Mappers.getMapper(DingRobotConvert.class);

    DingRobotConfig convert(DingRobotConfigParam in);

    DingRobotConfigDto convert(DingRobotConfig in);

}

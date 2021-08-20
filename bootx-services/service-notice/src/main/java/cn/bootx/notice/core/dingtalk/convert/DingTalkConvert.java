package cn.bootx.notice.core.dingtalk.convert;

import cn.bootx.notice.core.dingtalk.entity.DingRobotConfig;
import cn.bootx.notice.dto.dingtalk.DingRobotConfigDto;
import cn.bootx.notice.param.dingtalk.DingRobotConfigParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**   
* 钉钉相关类转换
* @author xxm  
* @date 2021/8/5 
*/
@Mapper
public interface DingTalkConvert {
    DingTalkConvert CONVERT = Mappers.getMapper(DingTalkConvert.class);

    @Mappings({})
    DingRobotConfig convert(DingRobotConfigDto in);

    @Mappings({})
    DingRobotConfig convert(DingRobotConfigParam in);

    @Mappings({})
    DingRobotConfigDto convert(DingRobotConfig in);

}

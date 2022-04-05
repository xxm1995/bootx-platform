package cn.bootx.starter.dingtalk.core.config.convert;

import cn.bootx.starter.dingtalk.core.config.entity.DingTalkConfig;
import cn.bootx.starter.dingtalk.dto.config.DingTalkConfigDto;
import cn.bootx.starter.dingtalk.param.config.DingTalkConfigParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**   
* 
* @author xxm  
* @date 2022/4/3 
*/
@Mapper
public interface DingConfigConvert {
    DingConfigConvert CONVERT = Mappers.getMapper(DingConfigConvert.class);

    DingTalkConfig convert(DingTalkConfigParam in);

    DingTalkConfigDto convert(DingTalkConfig in);

}

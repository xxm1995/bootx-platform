package cn.bootx.notice.core.template.convert;

import cn.bootx.notice.core.template.entity.MessageTemplate;
import cn.bootx.notice.dto.template.MessageTemplateDto;
import cn.bootx.notice.param.template.MessageTemplateParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**   
* 消息模板转换
* @author xxm  
* @date 2021/8/10 
*/
@Mapper
public interface MessageTemplateConvert {
    MessageTemplateConvert CONVERT = Mappers.getMapper(MessageTemplateConvert.class);

    @Mappings({})
    MessageTemplateDto convert(MessageTemplate in);

    @Mappings({})
    MessageTemplate convert(MessageTemplateDto in);

    @Mappings({})
    MessageTemplate convert(MessageTemplateParam in);
}

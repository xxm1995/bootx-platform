package cn.bootx.notice.core.mail.convert;

import cn.bootx.notice.core.mail.entity.MailConfig;
import cn.bootx.notice.dto.mail.MailConfigDto;
import cn.bootx.notice.param.mail.MailConfigParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**   
* 钉钉相关类转换
* @author xxm  
* @date 2021/8/5 
*/
@Mapper
public interface MailConvert {
    MailConvert CONVERT = Mappers.getMapper(MailConvert.class);

    @Mappings({})
    MailConfig convert(MailConfigDto in);

    @Mappings({})
    MailConfig convert(MailConfigParam in);

    @Mappings({})
    MailConfigDto convert(MailConfig in);
}

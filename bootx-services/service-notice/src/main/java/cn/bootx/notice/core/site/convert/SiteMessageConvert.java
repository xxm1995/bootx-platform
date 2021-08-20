package cn.bootx.notice.core.site.convert;

import cn.bootx.notice.core.site.entity.SiteMessage;
import cn.bootx.notice.dto.site.SiteMessageDto;
import cn.bootx.notice.param.site.SiteMessageParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**
* 站内信转换
* @author xxm
* @date 2021/8/7
*/
@Mapper
public interface SiteMessageConvert {
    SiteMessageConvert CONVERT = Mappers.getMapper(SiteMessageConvert.class);

    @Mappings({})
    SiteMessageDto convert(SiteMessage in);

    @Mappings({})
    SiteMessage convert(SiteMessageDto in);

    @Mappings({})
    SiteMessage convert(SiteMessageParam in);
}

package cn.bootx.sales.core.activity.convert;

import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.dto.activity.ActivityDto;
import cn.bootx.sales.dto.activity.SimpleActivity;
import cn.bootx.sales.param.activity.ActivityParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**
* 转换
* @author xxm
* @date 2021/5/19
*/
@Mapper
public interface ActivityConvert {
    ActivityConvert CONVERT = Mappers.getMapper(ActivityConvert.class);

    @Mapping(target = "activityMutual", ignore = true)
    Activity convert(ActivityParam in);

    @Mapping(target = "creator", ignore = true)
    Activity convert(ActivityDto in);

    @Mapping(target = "configValues", ignore = true)
    ActivityDto convert(Activity in);

    SimpleActivity simple(ActivityDto in);

    SimpleActivity simple(Activity in);
}
